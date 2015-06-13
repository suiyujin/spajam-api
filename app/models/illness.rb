class Illness < ActiveRecord::Base
  has_many :illness_monstars
  has_many :monstars, through: :illness_monstars
end
