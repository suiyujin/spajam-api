class RenameUsersToMonstars < ActiveRecord::Migration
  def change
    rename_table :users, :monstars
  end
end
