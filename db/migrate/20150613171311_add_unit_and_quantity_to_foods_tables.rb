class AddUnitAndQuantityToFoodsTables < ActiveRecord::Migration
  def change
    add_column :foodstaffs, :unit, :string
    add_column :ingredients, :unit, :string
    add_column :foodstaff_ingredients, :quantity, :float
  end
end
