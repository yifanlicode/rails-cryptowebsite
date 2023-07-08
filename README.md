# CoinRocket

This is a cryptocurrency watchlist application built with Ruby on Rails.
![image.png](https://s2.loli.net/2023/07/08/qJ7ESQBdliIXDw3.png)

## Top Features

- Live prices, list top 200+ cryptocurrencies by market cap.
  ![image.png](https://s2.loli.net/2023/07/08/sUYgWLEvpraicAt.png)

- Search and filter cryptocurrencies by name
  ![image.png](https://s2.loli.net/2023/07/08/Ob9fDA63Sp5mJIe.png)

- Users can view the details of a cryptocurrency.
  ![image.png](https://s2.loli.net/2023/07/08/aMvVR4k8oNYBH5c.png)

- Users can create an account and log in to the application.
  ![image.png](https://s2.loli.net/2023/07/08/u5vbcjAXTLBdoDQ.png)

- Logged in Users can create different Watchlists.
  ![image.png](https://s2.loli.net/2023/07/08/5LMuxWwkPjzSiC9.png)

- Users can add and remove cryptocurrencies to their watchlists.
  ![image.png](https://s2.loli.net/2023/07/08/SlMqBvKtmEWVn8c.png)

## Step by Step to Build

### 1. Gathering and Storing Data

#### APIs

- [CoinRanking API](https://api.coinranking.com/v2/coins).It is a free API that provides cryptocurrency data.
- [Faker Gem](https://github.com/faker-ruby/faker). It is used to generate fake users.

#### Database ERD Diagram

![image.png](https://s2.loli.net/2023/07/07/DCW964w2BqjHRgV.png)

**User Table**

| Column Name | Data Type |
| ----------- | --------- |
| email       | string    |
| password    | string    |

**Cryptocurrency Table**

| Column Name     | Data Type |
| --------------- | --------- |
| uuid            | string    |
| symbol          | string    |
| name            | string    |
| color           | string    |
| icon_url        | string    |
| market_cap      | string    |
| price           | string    |
| listed_at       | integer   |
| tier            | integer   |
| change          | string    |
| rank            | integer   |
| sparkline       | text      |
| low_volume      | boolean   |
| coinranking_url | string    |
| volume_24h      | string    |

**Watchlist Table**

| Column Name | Data Type  |
| ----------- | ---------- |
| user_id     | references |
| name        | string     |

**CryptocurrenciesWatchlists** (Join Table)

| Column Name       | Data Type  |
| ----------------- | ---------- |
| cryptocurrency_id | references |
| watchlist_id      | references |

#### AR Models

```bash

rails generate model Cryptocurrency uuid:string symbol:string name:string color:string icon_url:string market_cap:string price:string listed_at:integer tier:integer change:string rank:integer sparkline:text low_volume:boolean coinranking_url:string 24h_volume:string

rails generate model Watchlist user:references name:string

rails generate model CryptocurrenciesWatchlists cryptocurrency:references watchlist:references
```

Use Devise to generate the User model.

```bash
rails generate devise:install
rails generate devise User
rails generate devise:views
```

Run the migrations.

```bash
rails db:migrate
```

#### Model Associations and Validations

```ruby
class User < ApplicationRecord

 has_many :watchlists
 has_many :cryptocurrencies, through: :watchlists

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


class Cryptocurrency < ApplicationRecord
  has_many :cryptocurrencies_watchlists
  has_many :watchlists, through: :cryptocurrencies_watchlists

  validates :name, presence: true
  end

class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :cryptocurrencies_watchlists, dependent: :destroy
  has_many :cryptocurrencies, through: :cryptocurrencies_watchlists

  validates :user_id, presence: true
  validates :name, presence: true
end

class CryptocurrenciesWatchlist < ApplicationRecord
  belongs_to :cryptocurrency
  belongs_to :watchlist

  validates :cryptocurrency_id, presence: true
  validates :watchlist_id, presence: true
end
```

### 2. Web Site Navigation

- Home Page - Information
- About Page - About the APIs and Author
- Coins Page - List all the cryptocurrencies
- Coin Details Page - Show the details of a cryptocurrency
- Sign Up Page - Create an account
- Log In Page - Log in to the application
- Watchlist Page - Show all the cryptocurrencies in the watchlist
- Single Watchlist Page - Show all the cryptocurrencies in the watchlist

Coins page -> Coin details page -> Add to watchlist -> Watchlist page
-> Show all coins in the watchlist -> Show all watchlists

### 3. Pagination and Search

- Use the [kaminari gem](https://github.com/kaminari/kaminari) to add pagination to the index page.

- Easy to search and filter cryptocurrencies by name and rank.

- Search a cryptocurrency by name, symbol in Top100 or All or Potential coins.

### 4. Markup and Design

- Bootstrap 5
- Erb Conditional (if user is logged in, show the watchlist)
- HTML Validation

#### 5.Source Control

Use Git and GitHub to track changes and manage version control.

### 6. Deployment

Haven't deployed yet.
Plan to deploy to Heroku.

## Resources

- [Ruby on Rails 實戰聖經](https://ihower.tw/rails/)
  Good ebook to learn Ruby on Rails.

- [Learn Ruby on Rails - Full Course](https://www.youtube.com/watch?v=fmyvWz5TUWg&t=7411s)
  FreeCodeCamp Youtube video.

- [Sample: Board Game](https://board-game-freak.fly.dev/)
  A sample project built with Ruby on Rails and deployed to Fly.io.

## Pitfalls

- Many to many association between Cryptocurrency and Watchlist.
  If you want to add a cryptocurrency to a watchlist, you need to create a CryptocurrenciesWatchlist object. It you want to remove a cryptocurrency from a watchlist, you need to destroy the CryptocurrenciesWatchlist object.

- Devise gem
  If you already have a User model, you need to run the migration to add the devise columns to the User table.

- Search in the every page (navbar)
  I add the search form in the navbar, so I need to add the search function in every controller.

- .... A lot of pitfalls to learn.
