class HelpdeskScreenshot < ActiveRecord::Base
  attr_accessible :analyst_id, :analyst_number, :helpdesk_id, :screenshot,
                  :screenshot_content_type, :visible, :screenshot_file_size
  belongs_to :analyst
  belongs_to :helpdesk
  belongs_to :helpdesk

  mount_uploader :screenshot, ImagesUploader

  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
        "name" => read_attribute(:screenshot),
        "size" => screenshot.size,
        "url" => screenshot.url,
        "thumbnail_url" => screenshot.thumb.url,
        "helpdesk_id" => read_attribute(:helpdesk_id),
        "user" => read_attribute(:analyst_number),

        "delete_url" => id,
        "screenshot_id" => id,
        "visible" => read_attribute(:visible),
        "delete_type" => "DELETE"
    }
  end


end
