class FoodIngredient < ActiveRecord::Base
  belongs_to :food
  belongs_to :ingredient
end
