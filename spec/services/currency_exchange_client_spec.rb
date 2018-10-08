# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrencyExchangeClient do
  describe '#convert' do
    let(:params) do
      {
        'from' => 'USD',
        'to' => 'EUR'
      }
    end

    subject { described_class.convert(params) }

    it 'returns currency_exchange_rate' do
      expect(subject['error_message']).to be_present
      expect(subject['amount']).to be_present
      expect(subject['error']).to be_present
    end
  end
end
