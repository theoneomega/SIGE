class OfficesAttachment < ActiveRecord::Base
  attr_accessible :attachment, :id, :model, :office_id, :username
  belongs_to :user
  
  mount_uploader :attachment, OfficesAttachmentUploader
# mount_uploader :attachment, ImagesUploader
#  validates :attachment, :presence => true
  audited
  before_save :update_asset_attributes
  
  def update_asset_attributes
    if attachment.present? && attachment_changed?
      self.attachment_content_type = attachment.file.content_type
      self.attachment_file_size = attachment.file.size
    end
  end
  
  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "name" => read_attribute(:attachment),
      "size" => read_attribute(:attachment_file_size),
      "office_id" => read_attribute(:office_id),
      "user" => read_attribute(:username),
      "url" => attachment_url,
      "delete_url" => offices_attachment_path(self),
      "delete_type" => "DELETE"
    }
  end
end