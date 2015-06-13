class Foodstaff < ActiveRecord::Base
  has_many :food_foodstaffs
  has_many :foods, through: :food_foodstaffs

  has_many :foodstaff_ingredients
  has_many :ingredients, through: :foodstaff_ingredients
end
