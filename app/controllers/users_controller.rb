require 'ffaker'

class UsersController < ApplicationController
  protect_from_forgery except: :create

  # POST /users/create
  def create
    uuid = params[:uuid]
    user = User.new(uuid: uuid)

    # UUID以外はダミーデータを入れる
    user.name = FFaker::NameJA.first_name
    user.weight = Random.rand(40.0..80.0).round(1)
    user.height = Random.rand(150.0..180.0).round(1)
    user.sex = [0, 1].sample
    user.age = Random.rand(18..70)

    begin
      user.save
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
