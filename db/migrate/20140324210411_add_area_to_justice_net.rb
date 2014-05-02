class AddAreaToJusticeNet < ActiveRecord::Migration
  def change
    add_column :justice_nets, :area_id, :integer
  end
end
