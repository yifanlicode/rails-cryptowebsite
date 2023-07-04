class Cryptocurrency < ApplicationRecord
  has_many :cryptocurrency_watchlists
  has_many :watchlists, through: :cryptocurrency_watchlists

  validates :uuid, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
