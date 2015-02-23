class IphImage < ActiveRecord::Base
  include CarrierWave::MimeTypes
  attr_accessible :id, :iph_id, :name
  #  has_attached_file :name, :path => ":rails_root/public/respaldos/:class/:id/:basename.:extension"
  belongs_to :iph
  
  mount_uploader :name, ImagesUploader
  audited
  validates :name, :presence => true
  
  before_save :update_asset_attributes
  
  def update_asset_attributes
    if name.present? && name_changed?
      self.name_content_type = name.file.content_type
      self.name_file_size = name.file.size
    end
  end
  
  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "name" => read_attribute(:name),
      "size" => read_attribute(:name_file_size),
      "iph_id" => read_attribute(:iph_id) ,
      "url" => name_url,
      "delete_url" => iph_image_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
