class Monstar < ActiveRecord::Base
  has_many :food_monstars
  has_many :foods, through: :food_monstars

  has_many :illness_monstars
  has_many :illnesses, through: :illness_monstars
end
