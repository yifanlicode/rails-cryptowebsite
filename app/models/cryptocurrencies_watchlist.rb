class CryptocurrenciesWatchlist < ApplicationRecord
  belongs_to :cryptocurrency
  belongs_to :watchlist
end
