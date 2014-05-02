class AddAttachmentAttachmentToOfficesAttachments < ActiveRecord::Migration
  def self.up
    change_table :offices_attachments do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :offices_attachments, :attachment
  end
end
