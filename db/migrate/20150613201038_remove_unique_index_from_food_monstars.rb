class RemoveUniqueIndexFromFoodMonstars < ActiveRecord::Migration
  def change
    remove_index :food_monstars, [:food_id, :monstar_id]
  end
end
