class FoodstaffIngredient < ActiveRecord::Base
  belongs_to :foodstaff
  belongs_to :ingredient
end
