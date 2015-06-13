class RenameTypeToTypes < ActiveRecord::Migration
  def change
    rename_column :illness_ingredients, :type, :types
  end
end
