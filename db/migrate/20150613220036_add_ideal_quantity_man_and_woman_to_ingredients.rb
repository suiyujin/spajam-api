class AddIdealQuantityManAndWomanToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ideal_quantity_man, :float
    add_column :ingredients, :ideal_quantity_woman, :float
  end
end
