class User < ApplicationRecord

 has_many :watchlists
 has_many :cryptocurrencies, through: :watchlists


devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
