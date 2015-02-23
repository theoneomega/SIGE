class OfficePerson < ActiveRecord::Base
  attr_accessible :office_id, :person_id
  belongs_to :office
  belongs_to :person
  audited
  validates_uniqueness_of :office_id, :scope => :person_id
end
