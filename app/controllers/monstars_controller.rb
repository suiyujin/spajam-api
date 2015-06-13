require 'ffaker'

class MonstarsController < ApplicationController
  protect_from_forgery except: :create

  # GET /monstar
  def index
    uuid = params[:uuid]
    monstar = Monstar.select(:id, :name, :sex, :age, :hp, :decrease_rate).find_by(uuid: uuid)

    if monstar
      monstar_hash = monstar.attributes
      res = {
        result: true,
        data: {
          uuid: uuid,
          monstar: monstar_hash
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
