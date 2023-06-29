class User < ApplicationRecord
  has_many :watchlist
  has_many :cryptocurrencies, through: :watchlists

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
