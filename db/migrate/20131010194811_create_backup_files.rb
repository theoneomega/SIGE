class CreateBackupFiles < ActiveRecord::Migration
  def change
    create_table :backup_files do |t|
      t.integer :id
      t.string :file
      t.integer :event_id

      t.timestamps
    end
  end
end
