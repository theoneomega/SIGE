class ColaborationPhone < ActiveRecord::Base
  attr_accessible :colaboration_id, :phone_id
  belongs_to :colaboration
  belongs_to :phone
  validates_uniqueness_of :colaboration_id, :scope => :phone_id
  audited
end
