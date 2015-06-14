class RemoveUniqueIndex < ActiveRecord::Migration
  def change
    remove_foreign_key :food_monstars, :foods
    remove_foreign_key :food_monstars, :monstars
    remove_index :food_monstars, :food_id

    add_foreign_key :food_monstars, :foods
    add_foreign_key :food_monstars, :monstars
  end
end
