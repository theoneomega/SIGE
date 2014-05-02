class OfficeVehicle < ActiveRecord::Base
  attr_accessible :office_id, :vehicle_id
  belongs_to :office
  audited
  belongs_to :vehicle
  validates_uniqueness_of :office_id, :scope => :vehicle_id
end
