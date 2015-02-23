class BackupFile < ActiveRecord::Base
  attr_accessible :event_id, :file, :id, :description
  belongs_to :event
  mount_uploader :file, BackupFileUploader
  
  validates :description, :presence => true #{ :message => "Introduce una descripcion"} 
  audited
  def archivo
    self.event_id.to_s + " " + self.id.to_s
  end
end
