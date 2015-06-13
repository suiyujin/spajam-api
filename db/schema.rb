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

ActiveRecord::Schema.define(version: 20150613193802) do

  create_table "food_ingredients", force: :cascade do |t|
    t.integer  "food_id",       limit: 4
    t.integer  "ingredient_id", limit: 4
    t.float    "quantity",      limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "food_ingredients", ["food_id", "ingredient_id"], name: "index_food_ingredients_on_food_id_and_ingredient_id", unique: true, using: :btree
  add_index "food_ingredients", ["food_id"], name: "index_food_ingredients_on_food_id", using: :btree
  add_index "food_ingredients", ["ingredient_id"], name: "index_food_ingredients_on_ingredient_id", using: :btree

  create_table "food_monstars", force: :cascade do |t|
    t.integer  "food_id",    limit: 4
    t.integer  "monstar_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "food_monstars", ["food_id", "monstar_id"], name: "index_food_monstars_on_food_id_and_monstar_id", unique: true, using: :btree
  add_index "food_monstars", ["food_id"], name: "index_food_monstars_on_food_id", using: :btree
  add_index "food_monstars", ["monstar_id"], name: "fk_rails_d336adffdc", using: :btree

  create_table "foods", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "foods", ["name"], name: "index_foods_on_name", unique: true, using: :btree

  create_table "foodstaff_ingredients", force: :cascade do |t|
    t.integer  "foodstaff_id",  limit: 4
    t.integer  "ingredient_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "quantity",      limit: 24
  end

  add_index "foodstaff_ingredients", ["foodstaff_id", "ingredient_id"], name: "index_foodstaff_ingredients_on_foodstaff_id_and_ingredient_id", unique: true, using: :btree
  add_index "foodstaff_ingredients", ["foodstaff_id"], name: "index_foodstaff_ingredients_on_foodstaff_id", using: :btree
  add_index "foodstaff_ingredients", ["ingredient_id"], name: "index_foodstaff_ingredients_on_ingredient_id", using: :btree

  create_table "foodstaffs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "foodstaffs", ["name"], name: "index_foodstaffs_on_name", unique: true, using: :btree

  create_table "illness_ingredients", force: :cascade do |t|
    t.integer  "illness_id",    limit: 4
    t.integer  "ingredient_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "types",         limit: 1, null: false
  end

  add_index "illness_ingredients", ["illness_id"], name: "index_illness_ingredients_on_illness_id", using: :btree
  add_index "illness_ingredients", ["ingredient_id"], name: "index_illness_ingredients_on_ingredient_id", using: :btree

  create_table "illness_monstars", force: :cascade do |t|
    t.integer  "illness_id",    limit: 4
    t.integer  "monstar_id",    limit: 4
    t.float    "outbreak_rate", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "illness_monstars", ["illness_id", "monstar_id"], name: "index_illness_monstars_on_illness_id_and_monstar_id", unique: true, using: :btree
  add_index "illness_monstars", ["illness_id"], name: "index_illness_monstars_on_illness_id", using: :btree
  add_index "illness_monstars", ["monstar_id"], name: "fk_rails_8b89c4cca0", using: :btree

  create_table "illnesses", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "outbreak_rate", limit: 24
    t.float    "severity",      limit: 24
  end

  add_index "illnesses", ["name"], name: "index_illnesses_on_name", unique: true, using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "unit",       limit: 255
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

  create_table "monstars", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "sex",           limit: 4
    t.integer  "age",           limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "uuid",          limit: 255, null: false
    t.float    "hp",            limit: 24
    t.float    "decrease_rate", limit: 24
  end

  add_index "monstars", ["uuid"], name: "index_monstars_on_uuid", unique: true, using: :btree

  add_foreign_key "food_ingredients", "foods"
  add_foreign_key "food_ingredients", "ingredients"
  add_foreign_key "food_monstars", "foods"
  add_foreign_key "food_monstars", "monstars"
  add_foreign_key "foodstaff_ingredients", "foodstaffs"
  add_foreign_key "foodstaff_ingredients", "ingredients"
  add_foreign_key "illness_ingredients", "illnesses"
  add_foreign_key "illness_ingredients", "ingredients"
  add_foreign_key "illness_monstars", "illnesses"
  add_foreign_key "illness_monstars", "monstars"
end
