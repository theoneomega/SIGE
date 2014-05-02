class EventWeapon < ActiveRecord::Base
  attr_accessible :event_id, :weapon_id
  belongs_to :event
  belongs_to :fullevent
  belongs_to :weapon
  validates_uniqueness_of :event_id, :scope => :weapon_id
  audited
end
