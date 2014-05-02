class Place < ActiveRecord::Base
  attr_accessible :id, :place
  has_many :events, :dependent => :destroy
  has_many :fullevent
end
