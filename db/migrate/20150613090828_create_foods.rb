class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.float :calories

      t.timestamps null: false
    end
  end
end
