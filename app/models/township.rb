class Township < ActiveRecord::Base
  attr_accessible :di, :township
  has_many :events, :dependent => :destroy
  has_many :fullevent
  has_many :localities, :dependent => :destroy
end
