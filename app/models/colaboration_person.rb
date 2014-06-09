class ColaborationPerson < ActiveRecord::Base
  attr_accessible :colaboration_id, :person_id
  belongs_to :colaboration
  belongs_to :person
  validates_uniqueness_of :colaboration_id, :scope => :person_id
  audited
end
