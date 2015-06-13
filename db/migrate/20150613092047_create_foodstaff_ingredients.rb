class CreateFoodstaffIngredients < ActiveRecord::Migration
  def change
    create_table :foodstaff_ingredients do |t|
      t.references :foodstaff, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
