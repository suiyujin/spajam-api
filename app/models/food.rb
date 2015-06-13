class Food < ActiveRecord::Base
  has_many :food_users
  has_many :users, through: :food_users

  has_many :food_foodstaffs
  has_many :foodstaffs, through: :food_foodstaffs
end
