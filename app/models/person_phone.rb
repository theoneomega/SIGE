class PersonPhone < ActiveRecord::Base
  attr_accessible :person_id, :phone_id
  belongs_to :person
  belongs_to :phone
  audited
  validates_uniqueness_of :person_id, :scope => :phone_id
end
