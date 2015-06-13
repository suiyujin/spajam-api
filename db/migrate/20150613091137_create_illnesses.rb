class CreateIllnesses < ActiveRecord::Migration
  def change
    create_table :illnesses do |t|
      t.string :name
      t.integer :outbreak_age
      t.integer :survivable_months

      t.timestamps null: false
    end
  end
end
