class ColaborationFile < ActiveRecord::Base
  attr_accessible :colaboration_id, :description, :file, :id
  mount_uploader :file, ColaborationFileUploader
  audited
  
  validates :description, :presence => true #{ :message => "Introduce una descripcion"} 
  def archivo
    self.office_id.to_s + " " + self.id.to_s
  end
end
