class ColaborationVehicle < ActiveRecord::Base
  attr_accessible :colaboration_id, :vehicle_id
  belongs_to :vehicle
  belongs_to :colaboration_vehicle
  audited
end
