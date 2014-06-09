class OfficeWeapon < ActiveRecord::Base
  attr_accessible :office_id, :weapon_id
  belongs_to :office
  belongs_to :weapon
  audited
  validates_uniqueness_of :office_id, :scope => :weapon_id
end
