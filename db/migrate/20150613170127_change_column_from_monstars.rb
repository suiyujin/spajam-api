class ChangeColumnFromMonstars < ActiveRecord::Migration
  def change
    change_table :monstars do |t|
      t.remove :weight
      t.remove :height
      t.remove :lifespan
      t.float :hp
      t.float :decrease_rate
    end
  end
end
