class Cryptocurrency < ApplicationRecord
  paginates_per 50

  has_many :cryptocurrencies_watchlists
  has_many :watchlists, through: :cryptocurrencies_watchlists

  validates :name, presence: true
end