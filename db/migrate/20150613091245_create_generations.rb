class CreateGenerations < ActiveRecord::Migration
  def change
    create_table :generations do |t|
      t.integer :generation_start
      t.integer :generation_end
    end
  end
end
