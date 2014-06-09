class IphIphObject < ActiveRecord::Base
  attr_accessible :iph_id, :iph_object_id
  belongs_to :iph
  belongs_to :iph_object
  audited
  validates_uniqueness_of :iph_id, :scope => :iph_object
end
