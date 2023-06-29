class CreateCryptocurrenciesWatchlists < ActiveRecord::Migration[7.0]
  def change
    create_table :cryptocurrencies_watchlists do |t|
      t.references :cryptocurrency, null: false, foreign_key: true
      t.references :watchlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
