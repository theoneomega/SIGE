class AddScreenshotFileSizeToHelpdeskScreenshots < ActiveRecord::Migration
  def change
    add_column :helpdesk_screenshots, :screenshot_file_size, :integer
  end
end
