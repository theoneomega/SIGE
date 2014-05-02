class AddCommentToBackupFiles < ActiveRecord::Migration
  def change
    add_column :backup_files, :description, :text
  end
end
