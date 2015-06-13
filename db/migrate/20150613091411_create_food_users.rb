class CreateFoodUsers < ActiveRecord::Migration
  def change
    create_table :food_users do |t|
      t.references :food, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
