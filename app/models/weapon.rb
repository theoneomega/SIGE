class Weapon < ActiveRecord::Base
  attr_accessible :brand, :caliber, :id, :model, :person_id, :serial_number, :weapon, :weapon_type_id, :type
  attr_accessible :weapontype
  belongs_to :weapon_type
  belongs_to :person
  has_many :criminal_weapon, :dependent => :destroy
  has_many :office_weapon , :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :colaborations, :dependent => :destroy
#  belongs_to :criminal_group
  validates :weapon_type_id, :presence => true #, :message => 'selecciona tipo de arma'
  validates :model, :presence => true
  validates :brand, :presence => true
  validates :caliber, :presence => true
  
  def fulldescription
    self.brand + " " + self.model + " " + self.caliber
  end
  
  def weapontype
    self.weapon_type.desc
  end
end
