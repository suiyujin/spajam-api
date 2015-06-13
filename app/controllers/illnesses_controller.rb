class IllnessesController < ApplicationController
  protect_from_forgery except: :create

  # GET /illnesses
  def index
    uuid = params[:uuid]
    monstar = Monstar.select(:id).find_by(uuid: uuid)

    if monstar.present?
      illnesses_id = monstar.illness_monstars.order('decrease_rate DESC').pluck(:illness_id)
      # TODO: 無駄なクエリを改善
      illnesses_hash = illnesses_id.map do |illness_id|
        illness_hash = Illness.select(:id, :name).find(illness_id).attributes
        # TODO: 足りていない成分に対応する
        # 今はレコメンドはダミーデータ
        illness_hash['recommends'] = {
          name: 'ほうれん草',
          param: 20.5
        }
        illness_hash
      end

      res = {
        result: true,
        data: {
          uuid: uuid,
          illnesses: illnesses_hash
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
end
