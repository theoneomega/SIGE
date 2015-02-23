class JusticeNetFile < ActiveRecord::Base
  attr_accessible :id, :justice_net_id, :name, :description
  mount_uploader :name, JusticianetUploader
  audited
  validates :name, :presence => true
  validates :description, :presence => true
  
  belongs_to :justice_net, :dependent => :destroy
end
