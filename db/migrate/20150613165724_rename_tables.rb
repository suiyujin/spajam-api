class RenameTables < ActiveRecord::Migration
  def change
    rename_table :illness_users, :illness_monstars
    rename_table :food_users, :food_monstars

    rename_column :food_monstars, :user_id, :monstar_id
    rename_column :illness_monstars, :user_id, :monstar_id
  end
end
