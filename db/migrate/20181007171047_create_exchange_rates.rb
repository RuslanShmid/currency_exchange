class CreateExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
