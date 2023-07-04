# db/seeds.rb

require 'json'
require 'net/http'

# Seed fake data using Faker gem
30.times do
  User.create!(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password_digest: Faker::Internet.password
  )
end

# Seed data from CoinRanking API

url = 'https://api.coinranking.com/v2/coins'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

coin_data = data['data']['coins']
coin_data.each do |coin|
  Cryptocurrency.create(
    uuid: coin['uuid'],
    symbol: coin['symbol'],
    name: coin['name'],
    color: coin['color'],
    icon_url: coin['iconUrl'],
    market_cap: coin['marketCap'],
    price: coin['price'],
    listed_at: coin['listedAt'],
    tier: coin['tier'],
    change: coin['change'],
    rank: coin['rank'],
    sparkline: coin['sparkline'].to_json,
    coinranking_url: coin['coinrankingUrl'],
    volume_24h: coin['24hVolume']    
  )
end


puts 'Seeding completed!'
