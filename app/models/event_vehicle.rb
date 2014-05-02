class EventVehicle < ActiveRecord::Base
  attr_accessible :event_id, :vehicle_id
  belongs_to :event
  belongs_to :fullevent
  belongs_to :vehicle
  validates_uniqueness_of :event_id, :scope => :vehicle_id
  audited
end
