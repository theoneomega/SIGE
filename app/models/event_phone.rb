class EventPhone < ActiveRecord::Base
  attr_accessible :event_id, :phone_id
  belongs_to :event
  belongs_to :phone
  validates_uniqueness_of :event_id, :scope => :phone_id
  audited
end
