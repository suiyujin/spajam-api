class FoodFoodstaff < ActiveRecord::Base
  belongs_to :food
  belongs_to :foodstaff
end
