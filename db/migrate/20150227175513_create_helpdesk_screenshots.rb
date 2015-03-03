class CreateHelpdeskScreenshots < ActiveRecord::Migration
  def change
    create_table :helpdesk_screenshots do |t|
      t.integer :analyst_id
      t.string :analyst_number
      t.integer :helpdesk_id
      t.string :screenshot
      t.string :screenshot_content_type
      t.boolean :visible

      t.timestamps
    end
  end
end
