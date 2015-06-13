class User < ActiveRecord::Base
  has_many :food_users
  has_many :foods, through: :food_users

  has_many :illness_users
  has_many :illnesses, through: :illness_users
end
