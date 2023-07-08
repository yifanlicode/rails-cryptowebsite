
class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :cryptocurrencies_watchlists, dependent: :destroy
  has_many :cryptocurrencies, through: :cryptocurrencies_watchlists

  validates :user_id, presence: true
  validates :name, presence: true
end
