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

ActiveRecord::Schema.define(version: 20191122104805) do

  create_table "buy_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "count"
    t.boolean "send_status", default: false
    t.boolean "receive", default: true
    t.bigint "user_id"
    t.bigint "stationery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paid_number_id"
    t.index ["stationery_id"], name: "index_buy_items_on_stationery_id"
    t.index ["user_id"], name: "index_buy_items_on_user_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paid_numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rankings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "total_count"
    t.bigint "stationery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stationery_id"], name: "index_rankings_on_stationery_id"
  end

  create_table "stationeries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "price"
    t.string "maker"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stationery_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "stationery_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_stationery_categories_on_category_id"
    t.index ["stationery_id"], name: "index_stationery_categories_on_stationery_id"
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "count"
    t.bigint "stationery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stationery_id"], name: "index_stocks_on_stationery_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.integer "status"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_foreign_key "buy_items", "stationeries"
  add_foreign_key "buy_items", "users"
  add_foreign_key "rankings", "stationeries"
  add_foreign_key "stationery_categories", "categories"
  add_foreign_key "stationery_categories", "stationeries"
  add_foreign_key "stocks", "stationeries"
end
