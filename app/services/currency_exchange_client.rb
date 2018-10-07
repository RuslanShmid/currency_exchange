# frozen_string_literal: true

class CurrencyExchangeClient
  CURRENCY_EXCHANGE_URL = 'https://www.amdoren.com/api/currency.php'

  def self.convert(params)
    JSON.parse(make_request(params))
  end

  def self.make_request(params)
    RestClient::Request.execute(
      method: :get,
      url: CURRENCY_EXCHANGE_URL,
      headers: {
        params: {
          api_key: ENV['CURRENCY_API_KEY'],
          from: params['from'],
          to: params['to'],
          amount: '50'
        }
      }
    )
  end
end
