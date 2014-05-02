class IphIphPerson < ActiveRecord::Base
  attr_accessible :iph_id, :iph_person_id
  belongs_to :iph
  belongs_to :iph_person
  audited
  validates_uniqueness_of :iph_id, :scope => :iph_person
end
