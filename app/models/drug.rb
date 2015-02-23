class Drug < ActiveRecord::Base
  attr_accessible :id, :kind, :observations, :quantity
  belongs_to :person
  has_many :event
  has_many :criminal_drug, :dependent => :destroy
  has_many :event_drugs, :dependent => :destroy
end
