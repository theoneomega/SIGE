class JusticePerson < ActiveRecord::Base
  attr_accessible :justice_net_id, :person_id
  belongs_to :justice_net
  belongs_to :person
  validates_uniqueness_of :person_id, :scope => :justice_net_id
  audited
end
