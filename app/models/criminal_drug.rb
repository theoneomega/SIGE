class CriminalDrug < ActiveRecord::Base
  attr_accessible :criminal_group_id, :drug_id
  belongs_to :criminal_group
  belongs_to :drug
  validates_uniqueness_of :criminal_group_id, :scope => :drug_id
end
