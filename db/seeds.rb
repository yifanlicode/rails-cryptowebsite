# db/seeds.rb

require 'json'
require 'net/http'



# Seed data from CoinRanking API

url = 'https://api.coinranking.com/v2/coins?limit=200'
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


# Seed fake data using Faker gem
50.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password
  )
end

puts 'Seeding completed!'
