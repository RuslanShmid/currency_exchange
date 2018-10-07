class CreateHistoryExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :history_exchange_rates do |t|
      t.integer :exchange_rate_id
      t.decimal :amount

      t.timestamps
    end
  end
end
