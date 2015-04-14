class Crime < ActiveRecord::Base
  attr_accessible :crime, :id
  has_many :events

end
