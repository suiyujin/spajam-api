class MonstarsController < ApplicationController
  protect_from_forgery except: :create

  # GET /monstar
  def index
    uuid = params[:uuid]
    monstar = Monstar.select(:id, :name, :sex, :age, :hp, :decrease_rate, :created_at).find_by(uuid: uuid)

    begin
      monstar_hash = monstar.attributes
      monstar_hash['level'] = ((Time.zone.now - monstar.created_at)/(60*60*24)).floor + 1
      # decrease_rateを計算
      sum_decrease_rate = monstar.illness_monstars.pluck(:decrease_rate).inject(:+)

      decrease_rate = 2000.0 * (monstar.age.to_f / 10.0) + 100.0 * sum_decrease_rate

      # 体力
      last_eat_time = FoodMonstar.order('created_at DESC').find_by(monstar_id: monstar.id).created_at
      hp = 20000 - decrease_rate * (Time.zone.now - last_eat_time) / 60 / 20

      monstar.update_attributes(decrease_rate: decrease_rate,
                               hp: hp)

      res = {
        result: true,
        data: {
          uuid: uuid,
          monstar: monstar_hash
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

  # GET /result
  def result
    uuid = params[:uuid]
    monstar = Monstar.select(:id, :name, :sex, :created_at).find_by(uuid: uuid)

    if monstar.present?
      monstar_hash = monstar.attributes
      monstar_hash['level'] = ((Time.zone.now - monstar.created_at)/(60*60*24)).floor + 1

      illness = monstar.illness_monstars.select(:illness_id).order('decrease_rate DESC')[0].illness
      if monstar.sex == 0
        ingredients = illness.ingredients.select(:id, :name, :ideal_quantity_man)
      elsif monstar.sex == 1
        ingredients = illness.ingredients.select(:id, :name, :ideal_quantity_woman)
      end
      # 実際の量は今は決め打ち
      quantity = 2.5
      ingredients_hash = ingredients.map do |ingredient|
        ingredient_hash = ingredient.attributes
        ingredient_hash['quantity'] = quantity
        ingredient_hash
      end

      # おすすめメニューも決め打ち
      foods_hash = [Food.select(:id, :name).find(1).attributes, Food.select(:id, :name).find(2).attributes]

      res = {
        result: true,
        data: {
          uuid: uuid,
          monstar: monstar.attributes,
          illness: illness.attributes,
          ingredients: ingredients_hash,
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
    name = params[:name]
    age = params[:age]
    sex = params[:sex]

    monstar = Monstar.new(name: name,
                          age: age,
                          sex: sex,
                          uuid: uuid)

    begin
      monstar.save
      res = {
        result: true,
        data: {
          uuid: uuid
        }
      }
      status_code = 200

      set_illness_monster(monstar)
    rescue => e
      res = {
        result: false,
        message: e.message
      }
      status_code = 500
    end

    render json: res, status: status_code
  end

  def set_illness_monster(monstar)
    Illness.select(:id).all.each do |illness|
      IllnessMonstar.create(illness_id: illness.id,
                           monstar_id: monstar.id,
                           outbreak_rate: 0,
                           decrease_rate: 0)
    end
  end
end
