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

ActiveRecord::Schema.define(version: 20170405190419) do

  create_table "market_reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "market_id"
    t.string   "comment"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id"], name: "index_market_reviews_on_market_id"
    t.index ["user_id"], name: "index_market_reviews_on_user_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "rating"
    t.string   "description"
    t.integer  "open_time"
    t.integer  "close_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "address"
    t.integer  "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "description"
    t.string   "tag"
    t.integer  "store_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "popularity"
    t.boolean  "is_special"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shopping_lists_on_product_id"
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "store_reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "comment"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_reviews_on_store_id"
    t.index ["user_id"], name: "index_store_reviews_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "open_time"
    t.integer  "close_time"
    t.integer  "vendor_id"
    t.integer  "market_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["vendor_id"], name: "index_stores_on_vendor_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
    t.index ["vendor_id"], name: "index_subscriptions_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "description"
  end

  create_table "vendors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

end
