class CreateIllnessUsers < ActiveRecord::Migration
  def change
    create_table :illness_users do |t|
      t.references :illness, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :outbreak_rate

      t.timestamps null: false
    end
  end
end
