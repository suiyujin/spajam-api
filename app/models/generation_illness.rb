class GenerationIllness < ActiveRecord::Base
  belongs_to :generation
  belongs_to :illness
end
