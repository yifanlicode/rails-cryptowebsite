# README

## Introduction

This is a cryptocurrency watchlist application built with Ruby on Rails.

- Ruby on Rails
- SQLite
- ERB
- JSON
- APIs

## Usage

User can

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

#### Table: watchlist (join table)

| Column     | Type     | Description           |
| ---------- | -------- | --------------------- |
| id         | integer  | Primary Key           |
| user_id    | integer  | Foreign Key (users)   |
| coin_id    | integer  | Foreign Key (coins)   |
| created_at | datetime | Creation timestamp    |
| updated_at | datetime | Last update timestamp |

### 1.2 Database ERD Diagram

![PlantUML diagram.png](https://s2.loli.net/2023/06/29/HG2x9D3VEfiFrWC.png)

### 1.3 AR Models

Users and Coins Table

```bash
rails generate model User name:string email:string
rails generate model Coin symbol:string name:string color:string icon_url:string market_cap:string price:string listed_at:integer tier:integer change:string rank:integer sparkline:text low_volume:boolean coinranking_url:string volume_24h:string
```

WatchList Table

```bash
rails generate model Watchlist user:references coin:references
```

**🌟**🕯️ **1.4** **- At least 1 model Association -** Add an association to your ActiveRecord models to define at least one one-to-many or many-to-many relationship. (_Associations must be used in 3.x or 4.x features._)
至少一个 Model

**1.5 - Model Associations -**  Add multiple ActiveRecord associations to your models. (_These associations must be used in 3.x or 4.x features._)
            🕯️ **1.5** Two of more one-to-many associations.
            💡 **1.5** At least one one-to-many and one many-to-many association.
            **🔥 1.5** Two or more many-to-many associations.

💡 **1.6** **- Validations -** Add two or more appropriate validations to all of your ActiveRecord models to ensure that the data you import into your tables will be valid.
这个好做，要验证数据，比如某个字段不能为空

**1.7** **- Data Sources -** Write the seeds.rb script to pull in the data from your various sources into your database. You can use Faker as one of your data sources. Multiple CSV files and multiple endpoints from the same API will be considered separate data sources. 
可以使用 Faker 或者 CSV

🕯️ **1.7** Data is pulled from a single data source. (Faker is 1 source)
            💡 **1.7** Data is pulled from two data sources.
            如果是 2 个数据源 会加分
            🔥 **1.7** Data is pulled from three or more data sources.
            3 个 8 分

**For feature 1.7 the minimum number of table rows populated by your seed script is 200 rows. By this I mean 200 including rows from all tables.**

### 2 - Web Site Navigation

这是做 views

🕯️ **2.1** **- About Page -** Your web application has an about page that includes the details about your data sources from 1.1 and optionally your ERD from 1.2.
做一个简单的页面来介绍，比如 navbar ，做一个 about 页面，一些功能页
💡 **2.2 - Menu -** There is a menu present on all pages that includes links to two or more locations. (For example, a menu with a link to your homepage and your about page.)

## 3 - Data Navigation

**🌟** 🕯️ **3.1** - **Collection Navigation** - There exists a way for the user to navigate through the data you’ve collected at a high level. (For example, table or list of the entire data collection.)

对数据可以进行 筛选 排列

💡 **3.2** **- Member Pages -** There exists a page (show?) for each of the individual entries of the data you have collected to display all the attributes of the collected data point.

💡 **3.3** **- Multi-model Data on Member Pages -**  On the individual entry pages (3.2) data pulled from associated models is also present.
这个没理解

**🔥 3.4** **- Hierarchical Collection Navigation -** Data can be navigated by category or hierarchically based on a one-to-many or many-to-many relationship. (This means being able to navigate via a link back and forth between the “show” pages of your associations. For example, category “show” pages that link to the  “show” page of all items in that category, with the “show” pages of each item linking back to the “show” page of the item’s category.)
分类

💡 **3.5 - Pagination -** Large collections of data are presented using pagination. (You can use the [kaminari gem](https://github.com/kaminari/kaminari) or a javascript library to implement this feature.)

**🔥 3.6** **- Mapping -** Location data is presented on a map (either one map for the entire collection or a separate map for each data point). This feature will only be possible for students who have imported datasets that includes addresses or GPS coordinates. In other words, you can’t just add a random map to your project to get these marks. The map can be provided using the [Google Static Map API](https://developers.google.com/maps/documentation/static-maps/) or [Google Maps Javascript](https://www.driftingruby.com/episodes/plotting-points-on-a-map-from-scratch). (Google Maps API now requires a credit card to activate your API key. For low usage projects the API is still free. An alternative would be [the Map Box Static Map API](https://docs.mapbox.com/api/maps/#static).)

## 4 - Searching and Filtering

**🌟** 🕯️ **4.1** **- Simple Search -** Users can use a simple form to perform a text search through the available data.
用户可以搜索，这很重要

💡 **4.2** **- Hierarchical Search -** A user’s search can be restricted to a specific category (or other one-to-many / many-to-many relationship) using a dropdown within the search form.

### 5 - Markup and Design

**🌟** 🕯️ **5.1** **- Valid HTML -** All HTML generated by your app validates as HTML5 with no errors.
HTML 设计，送分

🕯️ **5.2 - ERB Conditional -** At least one of your ERB views includes a conditional (if or unless). _Don’t use the Demo example, use your own!_

💡 **5.3** **- Bootstrap Grid -** You built your markup and styling around the Bootstrap or Bulma CSS frameworks (or a similar framework). **_At a minimum_** your layout should be built around your framework’s **_grid system_**.
这个也是送分的。

### 6 - Source Control

**🌟** 🕯️ **6.1** **- GIT and GitHub -** You have configured git and github to keep your source under control with the ability to push from master to origin.
送分的

🕯️ **6.2** **- 20 GIT Commits -** You’ve used git to keep your source under control _with a minimum of 20 commits._ Commits must be accompanied by reasonable commit messages.
送分的
