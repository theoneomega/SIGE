class Phone < ActiveRecord::Base
  attr_accessible :id, :phone_number, :registered_from
  has_many :person_phone, :dependent => :destroy
  has_many :event_phone, :dependent => :destroy
  has_many :office_phone, :dependent => :destroy
  has_many :colaboration_phone, :dependent => :destroy
  audited
end
