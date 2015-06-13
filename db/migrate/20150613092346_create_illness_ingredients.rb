class CreateIllnessIngredients < ActiveRecord::Migration
  def change
    create_table :illness_ingredients do |t|
      t.references :illness, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
