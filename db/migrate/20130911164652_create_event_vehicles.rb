class CreateEventVehicles < ActiveRecord::Migration
  def change
    create_table :event_vehicles do |t|
      t.integer :event_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
