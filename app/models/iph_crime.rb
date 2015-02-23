class IphCrime < ActiveRecord::Base
  attr_accessible :concept, :id
  has_many :iphs
end
