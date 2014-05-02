class CriminalVehicle < ActiveRecord::Base
  attr_accessible :criminal_group_id, :vehicle_id
  belongs_to :criminal_group
  belongs_to :vehicle
  validates_uniqueness_of :criminal_group_id, :scope => :vehicle_id
end
