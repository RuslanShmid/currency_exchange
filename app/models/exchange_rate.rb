class ExchangeRate < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :history_exchange_rates
end
