class WeaponType < ActiveRecord::Base
  attr_accessible :desc, :id
  has_many :weapon, :dependent => :destroy
  has_many :iph_weapon, :dependent => :destroy
end
