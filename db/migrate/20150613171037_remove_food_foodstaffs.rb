class RemoveFoodFoodstaffs < ActiveRecord::Migration
  def change
    drop_table :food_foodstaffs
  end
end
