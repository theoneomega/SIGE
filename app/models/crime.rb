class Crime < ActiveRecord::Base
  attr_accessible :crime, :id
  has_many :events
  has_many :iphs

end
