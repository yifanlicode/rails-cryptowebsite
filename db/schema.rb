# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_29_164005) do
  create_table "cryptocurrencies", force: :cascade do |t|
    t.string "uuid"
    t.string "symbol"
    t.string "name"
    t.string "color"
    t.string "icon_url"
    t.string "market_cap"
    t.string "price"
    t.integer "listed_at"
    t.integer "tier"
    t.string "change"
    t.integer "rank"
    t.text "sparkline"
    t.boolean "low_volume"
    t.string "coinranking_url"
    t.string "volume_24h"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cryptocurrencies_watchlists", force: :cascade do |t|
    t.integer "cryptocurrency_id", null: false
    t.integer "watchlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cryptocurrency_id"], name: "index_cryptocurrencies_watchlists_on_cryptocurrency_id"
    t.index ["watchlist_id"], name: "index_cryptocurrencies_watchlists_on_watchlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "cryptocurrencies_watchlists", "cryptocurrencies"
  add_foreign_key "cryptocurrencies_watchlists", "watchlists"
  add_foreign_key "watchlists", "users"
end
