class RenameTables < ActiveRecord::Migration
  def change
    rename_table :illness_users, :illness_monstars
    rename_table :food_users, :food_monstars

    remove_index :food_monstars, [:food_id, :user_id]
    remove_index :illness_monstars, [:illness_id, :user_id]

    rename_column :food_monstars, :user_id, :monstar_id
    add_index :food_monstars, [:food_id, :monstar_id], unique: true
    rename_column :illness_monstars, :user_id, :monstar_id
    add_index :illness_monstars, [:illness_id, :monstar_id], unique: true
  end
end
