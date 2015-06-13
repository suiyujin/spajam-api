class AddDecreaseRateToIllnessMonstars < ActiveRecord::Migration
  def change
    add_column :illness_monstars, :decrease_rate, :float
  end
end
