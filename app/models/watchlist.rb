class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :cryptocurrency_watchlists
  has_many :cryptocurrencies, through: :cryptocurrencies_watchlists
end
