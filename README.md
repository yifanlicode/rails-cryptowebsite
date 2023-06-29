# README

This is a cryptocurrency watchlist application built with Ruby on Rails.

## 1 - Gathering and Storing Data

### 1.1 Datasets

1. [CoinRanking API](https://api.coinranking.com/v2/coins)

It is a free API that provides cryptocurrency data.

2. [Faker Gem](https://github.com/faker-ruby/faker)

It is a Ruby gem that generates fake data. It is used to generate fake users.

#### Table: users

| Column     | Type     | Description           |
| ---------- | -------- | --------------------- |
| id         | integer  | Primary Key           |
| name       | string   | User's name           |
| email      | string   | User's email          |
| created_at | datetime | Creation timestamp    |
| updated_at | datetime | Last update timestamp |

#### Table: coins

| Column          | Type     | Description                    |
| --------------- | -------- | ------------------------------ |
| id              | integer  | Primary Key                    |
| symbol          | string   | Cryptocurrency symbol          |
| name            | string   | Cryptocurrency name            |
| color           | string   | Color representation           |
| icon_url        | string   | URL of the cryptocurrency icon |
| market_cap      | string   | Market capitalization          |
| price           | string   | Cryptocurrency price           |
| listed_at       | integer  | Listing timestamp              |
| tier            | integer  | Tier level                     |
| change          | string   | Change in value                |
| rank            | integer  | Cryptocurrency rank            |
| sparkline       | text     | Price trend graph              |
| low_volume      | boolean  | Indicates low trading volume   |
| coinranking_url | string   | CoinRanking URL                |
| volume_24h      | string   | 24-hour trading volume         |
| created_at      | datetime | Creation timestamp             |
| updated_at      | datetime | Last update timestamp          |

#### Table: watchlist (_Optional_)

| Column     | Type     | Description           |
| ---------- | -------- | --------------------- |
| id         | integer  | Primary Key           |
| user_id    | integer  | Foreign Key (users)   |
| coin_id    | integer  | Foreign Key (coins)   |
| created_at | datetime | Creation timestamp    |
| updated_at | datetime | Last update timestamp |

### 1.2 Database ERD Diagram

![PlantUML diagram.png](https://s2.loli.net/2023/06/29/HG2x9D3VEfiFrWC.png)
