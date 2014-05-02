class CreateIphIphVehicles < ActiveRecord::Migration
  def change
    create_table :iph_iph_vehicles do |t|
      t.integer :iph_id
      t.integer :iph_vehicle_id

      t.timestamps
    end
  end
end
