require 'csv'

# foods
CSV.foreach('db/seed/foods.csv') do |row|
  Food.create(name: row[1])
end

# illnesses
CSV.foreach('db/seed/illnesses.csv') do |row|
  Illness.create(name: row[0],
             outbreak_rate: row[1],
             severity: row[2])
end

# ingredients
CSV.foreach('db/seed/ingredients.csv') do |row|
  Ingredient.create(name: row[1],
             unit: row[2],
             ideal_quantity_man: row[3],
             ideal_quantity_woman: row[4])
end

# monstars
CSV.foreach('db/seed/monsters.csv') do |row|
  Monstar.create(name: row[0],
             sex: row[1],
             age: row[2],
             hp: row[3],
             uuid: row[4],
             decrease_rate: row[5])
end

# foodstaffs
CSV.foreach('db/seed/foodstuffs.csv') do |row|
  Foodstaff.create(name: row[0])
end


# food_ingredients
CSV.foreach('db/seed/food_ingredients.csv') do |row|
  FoodIngredient.create(food_id: row[0],
             ingredient_id: row[1],
             quantity: row[2])
end

# food_monstars
CSV.foreach('db/seed/food_monsters.csv') do |row|
  FoodMonstar.create(food_id: row[0],
             monstar_id: row[1])
end

# illness_ingredients
CSV.foreach('db/seed/illness_ingredients.csv') do |row|
  IllnessIngredient.create(illness_id: row[0],
             ingredient_id: row[1],
             types: row[2])
end

# illness_monstars
CSV.foreach('db/seed/illness_monsters.csv') do |row|
  IllnessMonstar.create(illness_id: row[0],
             monstar_id: row[1],
             outbreak_rate: row[2],
             decrease_rate: row[3])
end

# foodstaff_ingredients
CSV.foreach('db/seed/foodstuff_ingredients.csv') do |row|
  FoodstaffIngredient.create(foodstaff_id: row[0],
             ingredient_id: row[1],
             quantity: row[2])
end
