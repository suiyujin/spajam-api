class Food < ActiveRecord::Base
  has_many :food_monstars
  has_many :monstars, through: :food_monstars

  has_many :food_ingredients
  has_many :ingredients, through: :food_ingredients
end
