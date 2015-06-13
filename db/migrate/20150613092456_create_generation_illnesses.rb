class CreateGenerationIllnesses < ActiveRecord::Migration
  def change
    create_table :generation_illnesses do |t|
      t.references :generation, index: true, foreign_key: true
      t.references :illness, index: true, foreign_key: true
      t.float :death_rate

      t.timestamps null: false
    end
  end
end
