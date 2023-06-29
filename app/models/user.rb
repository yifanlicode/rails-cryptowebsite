class User < ApplicationRecord
  has_many :watchlist
  has_many :cryptocurrencies, through: :watchlists
end
