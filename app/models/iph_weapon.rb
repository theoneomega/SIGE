class IphWeapon < ActiveRecord::Base
  attr_accessible :brand, :caliber, :id, :model, :serial_number, :weapon, :weapon_type_id
  belongs_to :weapon_type
  validates :caliber, :presence => true
  
  def description
    self.brand + " " + self.caliber
  end
  audited
  def weapontype
    self.weapon_type.desc+" "+self.caliber
  end
end
