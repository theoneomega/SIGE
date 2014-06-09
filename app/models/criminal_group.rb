class CriminalGroup < ActiveRecord::Base
  attr_accessible :area_id, :description, :drug_id, :id, :vehicle_id, :weapon_id
  attr_accessible :vehicles_attributes, :criminal_weapon_attributes , :weapons_attributes
  attr_accessible :criminal_vehicle_attributes
  attr_accessible :drugs_attributes, :criminal_drugs_attributes
  belongs_to :area
  has_many :vehicles, :through => :criminal_vehicles
  has_many :weapons, :through => :criminal_weapons
  has_many :drugs, :through => :criminal_drugs
  has_many :criminal_drugs, :dependent => :destroy
  has_many :criminal_vehicles, :dependent => :destroy
  has_many :criminal_weapons, :dependent => :destroy
 
  #accepts_nested_attributes_for :criminal_weapon, :allow_destroy => true, :reject_if => :all_blank
  #accepts_nested_attributes_for :criminal_vehicle, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :weapons, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :vehicles, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :drugs, :allow_destroy => true, :reject_if => :all_blank
#  accepts_nested_attributes_for :criminal_drug, :allow_destroy => true, :reject_if => :all_blank
end
