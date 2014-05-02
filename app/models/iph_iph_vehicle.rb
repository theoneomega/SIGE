class IphIphVehicle < ActiveRecord::Base
  attr_accessible :iph_id, :iph_vehicle_id
  belongs_to :iph
  audited
  belongs_to :iph_vehicle
  validates_uniqueness_of :iph_id, :scope => :iph_vehicle
end
