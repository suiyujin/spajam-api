# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150613091411) do

  create_table "food_users", force: :cascade do |t|
    t.integer  "food_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "food_users", ["food_id"], name: "index_food_users_on_food_id", using: :btree
  add_index "food_users", ["user_id"], name: "index_food_users_on_user_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "calories",   limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "foodstaffs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "generations", force: :cascade do |t|
    t.integer "generation_start", limit: 4
    t.integer "generation_end",   limit: 4
  end

  create_table "illnesses", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "outbreak_age",      limit: 4
    t.integer  "survivable_months", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "weight",     limit: 24
    t.float    "height",     limit: 24
    t.integer  "sex",        limit: 4
    t.integer  "age",        limit: 4
    t.integer  "lifespan",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "food_users", "foods"
  add_foreign_key "food_users", "users"
end
