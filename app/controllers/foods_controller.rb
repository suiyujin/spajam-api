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

  # POST /monstar/create
  def create
    uuid = params[:uuid]
    monstar = Monstar.new(uuid: uuid)

    # UUID以外はダミーデータを入れる
    monstar.name = FFaker::NameJA.first_name
    monstar.sex = [0, 1].sample
    monstar.age = Random.rand(18..70)

    begin
      monstar.save
      res = {
        result: true,
        data: {
          uuid: uuid
        }
      }
      status_code = 200
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
