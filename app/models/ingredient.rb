class Ingredient < ActiveRecord::Base
  has_many :food_ingredients
  has_many :foods, through: :food_ingredients

  has_many :foodstaff_ingredients
  has_many :foodstaffs, through: :foodstaff_ingredients

  has_many :illness_ingredients
  has_many :illnesses, through: :illness_ingredients
end
