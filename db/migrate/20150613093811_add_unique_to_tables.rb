class AddUniqueToTables < ActiveRecord::Migration
  def change
    add_index :users, :uuid, :unique => true
    add_index :foods, :name, :unique => true
    add_index :foodstaffs, :name, :unique => true
    add_index :ingredients, :name, :unique => true
    add_index :illnesses, :name, :unique => true
    add_index :generations, [:generation_start, :generation_end], :unique => true
    add_index :food_users, [:food_id, :user_id], :unique => true
    add_index :food_foodstaffs, [:food_id, :foodstaff_id], :unique => true
    add_index :foodstaff_ingredients, [:foodstaff_id, :ingredient_id], :unique => true
    add_index :illness_ingredients, [:illness_id, :ingredient_id], :unique => true
    add_index :illness_users, [:illness_id, :user_id], :unique => true
    add_index :generation_illnesses, [:generation_id, :illness_id], :unique => true
  end
end
