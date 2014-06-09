class CriminalWeapon < ActiveRecord::Base
  attr_accessible :criminal_group_id, :weapon_id
  belongs_to :criminal_group
  belongs_to :weapon
  validates_uniqueness_of :criminal_group_id, :scope => :weapon_id
end
  