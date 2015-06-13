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

ActiveRecord::Schema.define(version: 20150613092047) do

  create_table "food_foodstaffs", force: :cascade do |t|
    t.integer  "food_id",      limit: 4
    t.integer  "foodstaff_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "food_foodstaffs", ["food_id"], name: "index_food_foodstaffs_on_food_id", using: :btree
  add_index "food_foodstaffs", ["foodstaff_id"], name: "index_food_foodstaffs_on_foodstaff_id", using: :btree

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

  create_table "foodstaff_ingredients", force: :cascade do |t|
    t.integer  "foodstaff_id",  limit: 4
    t.integer  "ingredient_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "foodstaff_ingredients", ["foodstaff_id"], name: "index_foodstaff_ingredients_on_foodstaff_id", using: :btree
  add_index "foodstaff_ingredients", ["ingredient_id"], name: "index_foodstaff_ingredients_on_ingredient_id", using: :btree

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

  add_foreign_key "food_foodstaffs", "foods"
  add_foreign_key "food_foodstaffs", "foodstaffs"
  add_foreign_key "food_users", "foods"
  add_foreign_key "food_users", "users"
  add_foreign_key "foodstaff_ingredients", "foodstaffs"
  add_foreign_key "foodstaff_ingredients", "ingredients"
end
