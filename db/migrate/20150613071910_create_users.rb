class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :weight
      t.float :height
      t.integer :sex
      t.integer :age
      t.integer :lifespan

      t.timestamps null: false
    end
  end
end
