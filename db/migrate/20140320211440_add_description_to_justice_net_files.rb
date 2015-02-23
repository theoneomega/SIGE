class AddDescriptionToJusticeNetFiles < ActiveRecord::Migration
  def change
    add_column :justice_net_files, :description, :text
  end
end
