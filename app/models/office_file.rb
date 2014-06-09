class OfficeFile < ActiveRecord::Base
 attr_accessible :file, :id, :office_id, :description
  mount_uploader :file, OfficeUploader
  audited
  
  validates :description, :presence => true #{ :message => "Introduce una descripcion"} 
  
    def archivo
      self.office_id.to_s + " " + self.id.to_s
    end
end

  
  
  
   
 