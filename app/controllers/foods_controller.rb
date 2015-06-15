class FoodsController < ApplicationController
  protect_from_forgery except: :create

  # GET /foods/search
  def search
    query = params[:query]
    foods = Food.select(:id, :name).where("name like '%#{query}%'")

    if foods.present?
      foods_hash = foods.map { |food| food.attributes }
      res = {
        result: true,
        data: {
          query: query,
          foods: foods_hash
        }
      }
      status_code = 200
    else
      res = {
        result: false
      }
      status_code = 500
    end

    render json: res, status: status_code
  end

  # POST /food/create
  def create
    uuid = params[:uuid]
    monstar = Monstar.select(:id).find_by(uuid: uuid)
    food_id = params[:food_id]
    food = Food.find(food_id)

    food_monstar = FoodMonstar.new(food_id: food_id,
                   monstar_id: monstar.id)

    begin
      food_monstar.save
      res = {
        result: true,
        data: {
          uuid: uuid,
          food_id: food_id
        }
      }
      status_code = 200

      # 病気を調べる、減らす量を計算する
      ingredients_hash = food.food_ingredients.map do |food_ingredient|
        ingredient_hash = food_ingredient.ingredient.attributes
        ingredient_hash['quantity'] = food_ingredient.quantity
        ingredient_hash
      end

      # 理想値と実際の量を比較
      over_ingredients = ingredients_hash.select do |ingredient|
        ingredient['judge'] = (ingredient['quantity'].to_f / (ingredient['ideal_quantity_man'].to_f / 3.0))
        ingredient['judge'].to_f >= 1.2
      end

      # 超えてるとやばい病気を探す
      illnesses_id = Array.new
      over_ingredients.each do |over_ingredient|
        begin
          illnesses_id.concat(IllnessIngredient.where(ingredient_id: over_ingredient['id'].to_i).where(types: true).pluck(:illness_id))
        rescue
        end
      end

      # 病気を格納
      illnesses_id.uniq.each do |illness_id|
        ing = IllnessIngredient.where(illness_id: illness_id).where(types: true)
        ing_num = ing.count.to_f

        sum_judge = 0.0
        ing.pluck(:ingredient_id).each do |ingredient_id|
          begin
            sum_judge += over_ingredients.find { |over_ingredient| over_ingredient['id'] == ingredient_id }['judge'].to_f
          rescue
          end
        end

        illness = Illness.select(:outbreak_rate, :severity).find(illness_id)
        outbreak_rate = 0.2 * (illness.outbreak_rate + (sum_judge - 1.0) / ing_num)

        decrease_rate = outbreak_rate * illness.severity

        IllnessMonstar.find_by(illness_id: illness_id)
        .update_attributes(outbreak_rate: outbreak_rate,                                                         decrease_rate: decrease_rate)
      end

    rescue => e
      res = {
        result: false,
        message: e.message
      }
      status_code = 500
    end

    render json: res, status: status_code
  end

end
