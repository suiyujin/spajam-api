class CreateFoodIngredients < ActiveRecord::Migration
  def change
    create_table :food_ingredients do |t|
      t.references :food, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.float :quantity

      t.timestamps null: false
      t.index [:food_id, :ingredient_id], unique: true
    end
  end
end
