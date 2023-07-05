class CryptocurrenciesWatchlist < ApplicationRecord
  belongs_to :cryptocurrency
  belongs_to :watchlist

  validates :cryptocurrency_id, presence: true
  validates :watchlist_id, presence: true
end