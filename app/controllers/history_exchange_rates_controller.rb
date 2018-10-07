class HistoryExchangeRatesController < ApplicationController
  before_action :exchange_rates, only: %i[index current_rate]

  def index; end

  def current_rate; end

  private

  def exchange_rates
    @exchange_rates ||= current_user.exchange_rates
  end
end
