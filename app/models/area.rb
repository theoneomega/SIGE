class Area < ActiveRecord::Base
  attr_accessible :description, :id
  has_many :events, :dependent => :destroy
  has_many :criminal_groups, :dependent => :destroy
  has_many :analysts
  has_many :colaborations
  has_many :offices
  has_many :justice_nets
end
