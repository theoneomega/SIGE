class AddDescriptionToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :detail, :text
  end
end
