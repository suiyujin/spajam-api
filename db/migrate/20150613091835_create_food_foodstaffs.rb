class CreateFoodFoodstaffs < ActiveRecord::Migration
  def change
    create_table :food_foodstaffs do |t|
      t.references :food, index: true, foreign_key: true
      t.references :foodstaff, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
