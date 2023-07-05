class Cryptocurrency < ApplicationRecord
  has_many :cryptocurrencies_watchlists
  has_many :watchlists, through: :cryptocurrencies_watchlists

  validates :name, presence: true
end