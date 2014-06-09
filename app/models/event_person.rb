class EventPerson < ActiveRecord::Base
  attr_accessible :event_id, :person_id
  belongs_to :event
  belongs_to :events_collection
  belongs_to :person, :dependent => :destroy
  validates_uniqueness_of :event_id, :scope => :person_id
  audited
end
