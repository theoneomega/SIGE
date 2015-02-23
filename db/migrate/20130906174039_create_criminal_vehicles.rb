class CreateCriminalVehicles < ActiveRecord::Migration
  def change
    create_table :criminal_vehicles do |t|
      t.integer :vehicle_id
      t.integer :criminal_group_id

      t.timestamps
    end
  end
end
