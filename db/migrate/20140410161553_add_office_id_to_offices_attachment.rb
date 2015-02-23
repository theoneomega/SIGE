class AddOfficeIdToOfficesAttachment < ActiveRecord::Migration
  def change
    add_column :offices_attachments, :office_id, :integer
  end
end
