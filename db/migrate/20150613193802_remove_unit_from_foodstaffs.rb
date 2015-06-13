class RemoveUnitFromFoodstaffs < ActiveRecord::Migration
  def change
    remove_column :foodstaffs, :unit
  end
end
