class AddIphIdToIphVehicles < ActiveRecord::Migration
  def change
    add_column :iph_vehicles, :iph_id, :integer
  end
end
