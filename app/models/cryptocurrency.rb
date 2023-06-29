class Cryptocurrency < ApplicationRecord
  has_many :cryptocurrency_watchlists
  has_many :watchlists, through: :cryptocurrency_watchlists

  validates :uuid, presence: true
  validates :symbol, presence: true
  validates :name, presence: true
  validates :color, presence: true
  validates :icon_url, presence: true
  validates :market_cap, presence: true
  validates :price, presence: true
  validates :listed_at, presence: true
  validates :tier, presence: true
  validates :change, presence: true
  validates :rank, presence: true
  validates :volume_24h, presence: true
end
