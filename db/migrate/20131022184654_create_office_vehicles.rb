class CreateOfficeVehicles < ActiveRecord::Migration
  def change
    create_table :office_vehicles do |t|
      t.integer :vehicle_id
      t.integer :office_id

      t.timestamps
    end
  end
end
