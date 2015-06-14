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

      # TODO: 病気を調べる、減らす量を計算する
      # 今はダミーの病気を登録しておく

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
