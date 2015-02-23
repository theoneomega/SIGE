class AnbInvestigation < ActiveRecord::Base
  attr_accessible :analyst_id, :anb, :anb_content_type, :anb_file_size, :attachment_updated_at,
                  :investigation_id, :visible, :analyst_number
  belongs_to :analyst

  mount_uploader :anb, InvestigationFileUploader
  audited



  before_save :update_asset_attributes

  def update_asset_attributes
    if anb.present? && anb_changed?
      self.anb_content_type = anb.file.content_type
      self.anb_file_size = anb.file.size
    end
  end

  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
        "name" => read_attribute(:anb),
        "size" => read_attribute(:anb_file_size),
        "investigation_id" => read_attribute(:investigation_id),
        "user" => read_attribute(:analyst_number),
        "url" => anb_url,
        "delete_url" => anb_investigation_path(self),
        "visible" => read_attribute(:visible),
        "delete_type" => "DELETE"
    }
  end
end
