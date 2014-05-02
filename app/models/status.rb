class Status < ActiveRecord::Base
  attr_accessible :description, :id, :status_type, :detail
  has_many :person, :dependent => :destroy
  has_many :event, :dependent => :destroy 
  has_many :colaborations
  has_many :offices
  has_many :iph_person
  has_many :justice_nets
end
