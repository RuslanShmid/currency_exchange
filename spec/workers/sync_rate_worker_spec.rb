# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SyncRateWorker do
  before do
    user = User.create(email: 'ivan@gmail.com', password: '12345678')

    ExchangeRate.create(from: 'UAH', to: 'EUR')

    exchange_rate_usd_to_eru = ExchangeRate.create(from: 'USD', to: 'EUR')
    exchange_rate_usd_to_eru.users.append(user)

    HistoryExchangeRate.create(amount: '17.535', exchange_rate: exchange_rate_usd_to_eru)
  end

  describe '#perform' do
    let(:call) { described_class.new.perform }

    it 'Get currency for each ExchangeRate' do
      expect { call }.to change(HistoryExchangeRate, :count).by(2)
    end
  end
end
