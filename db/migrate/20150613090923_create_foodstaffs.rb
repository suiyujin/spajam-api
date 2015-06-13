class CreateFoodstaffs < ActiveRecord::Migration
  def change
    create_table :foodstaffs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
