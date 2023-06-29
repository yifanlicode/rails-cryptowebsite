class CreateCryptocurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :cryptocurrencies do |t|
      t.string :uuid
      t.string :symbol
      t.string :name
      t.string :color
      t.string :icon_url
      t.string :market_cap
      t.string :price
      t.integer :listed_at
      t.integer :tier
      t.string :change
      t.integer :rank
      t.text :sparkline
      t.boolean :low_volume
      t.string :coinranking_url
      t.string :volume_24h

      t.timestamps
    end
  end
end
