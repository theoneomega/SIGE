class ColaborationWeapon < ActiveRecord::Base
  attr_accessible :colaboration_id, :weapon_id
  belongs_to :colaboration
  belongs_to :weapon
  validates_uniqueness_of :colaboration_id, :scope => :weapon_id
  audited
end
