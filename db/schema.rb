# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_25_190032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pair_id"
    t.decimal "balance", precision: 35, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_type"
    t.decimal "units", precision: 35, scale: 6, default: "0.0"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "account_id"
    t.integer "user_id"
    t.integer "pair_id"
    t.decimal "value", precision: 35, scale: 2, default: "0.0"
    t.string "order_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "trading_price", precision: 35, scale: 6
  end

  create_table "pairs", force: :cascade do |t|
    t.string "code"
    t.string "trend", default: "right"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "ranking", default: 0
    t.integer "level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "valuations", force: :cascade do |t|
    t.integer "pair_id"
    t.decimal "price", precision: 35, scale: 8, default: "0.0"
    t.decimal "bid", precision: 35, scale: 8, default: "0.0"
    t.decimal "ask", precision: 35, scale: 8, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "timestamp"
    t.string "trend", default: "right"
  end

end
