class Illness < ActiveRecord::Base
  has_many :illness_users
  has_many :users, through: :illness_users

  has_many :generation_illnesses
  has_many :generations, through: :generation_illnesses
end
