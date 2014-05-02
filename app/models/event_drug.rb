class EventDrug < ActiveRecord::Base
  attr_accessible :drug_id, :event_id
  belongs_to :event
  belongs_to :fullevent
  belongs_to :drug
  validates_uniqueness_of :event_id, :scope => :drug_id
  audited
end
