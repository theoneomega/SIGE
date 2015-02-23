class AddStatusIdToJusticeNet < ActiveRecord::Migration
  def change
    add_column :justice_nets, :status_id, :integer
  end
end
