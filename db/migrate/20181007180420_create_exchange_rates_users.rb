class CreateExchangeRatesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates_users do |t|
      t.integer :user_id
      t.integer :exchange_rate_id

      t.timestamps
    end
  end
end
