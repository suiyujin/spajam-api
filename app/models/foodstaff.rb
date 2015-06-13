class Foodstaff < ActiveRecord::Base
  has_many :foodstaff_ingredients
  has_many :ingredients, through: :foodstaff_ingredients
end
