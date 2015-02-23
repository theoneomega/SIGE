class CreateOfficesAttachments < ActiveRecord::Migration
  def change
    create_table :offices_attachments do |t|
      t.integer :id
      t.string :attachment
      t.string :model

      t.timestamps
    end
  end
end
