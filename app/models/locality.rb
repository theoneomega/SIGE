class Locality < ActiveRecord::Base
  attr_accessible :id, :locality, :township_id
  belongs_to :township
  has_many :events, :dependent => :destroy
  has_many :iphs, :dependent => :destroy
  audited
  
  def localidad
   "#{self.township.township} - #{self.locality}"
end
  
end
