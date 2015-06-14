class DefaultHp < ActiveRecord::Migration
  def change
    change_column :monstars, :hp, :float, default: 20000.0
  end
end
