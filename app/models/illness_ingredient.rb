class IllnessIngredient < ActiveRecord::Base
  belongs_to :illness
  belongs_to :ingredient
end
