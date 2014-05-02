class CreateColaborationVehicles < ActiveRecord::Migration
  def change
    create_table :colaboration_vehicles do |t|
      t.integer :colaboration_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
