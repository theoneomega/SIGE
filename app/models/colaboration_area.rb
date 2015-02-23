class ColaborationArea < ActiveRecord::Base
  attr_accessible :area, :id
  has_many :colaboration ,:foreign_key => :colaboration_area_id
end
