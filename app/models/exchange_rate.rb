class ExchangeRate < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :exchange_rate_history
end
