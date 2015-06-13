class DropGenerationsAndGenerationIllnesses < ActiveRecord::Migration
  def change
    drop_table :generation_illnesses
    drop_table :generations
  end
end
