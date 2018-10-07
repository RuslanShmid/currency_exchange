# frozen_string_literal: true

class SyncRateWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    ExchangeRate.all.each do |rate|
      sync_exchange_rate(rate)
    end
  end

  private

  def sync_exchange_rate(rate)
    response = CurrencyExchangeClient.convert(rate)
    return unless response['error'].zero?

    HistoryExchangeRate.create(
      exchange_rate_id: rate.id,
      amount: response['amount']
    )
  end
end
