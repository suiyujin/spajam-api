class RemoveCaloriesFromFoods < ActiveRecord::Migration
  def change
    remove_column :foods, :calories
  end
end
