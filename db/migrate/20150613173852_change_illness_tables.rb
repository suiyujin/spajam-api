class ChangeIllnessTables < ActiveRecord::Migration
  def change
    change_table :illnesses do |t|
      t.remove :outbreak_age
      t.float :outbreak_rate
      t.remove :survivable_months
      t.float :severity
    end

    add_column :illness_ingredients, :type, :boolean, null: false
  end
end
