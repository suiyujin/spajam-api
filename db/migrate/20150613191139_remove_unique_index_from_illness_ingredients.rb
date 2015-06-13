class RemoveUniqueIndexFromIllnessIngredients < ActiveRecord::Migration
  def change
    remove_index :illness_ingredients, [:illness_id, :ingredient_id]
  end
end
