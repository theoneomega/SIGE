class CreateIphVehicles < ActiveRecord::Migration
  def change
    create_table :iph_vehicles do |t|
      t.integer :id
      t.string :brand
      t.string :line
      t.integer :model
      t.string :plate
      t.string :serial_number
      t.string :color
      t.boolean :stolen
      t.text :details

      t.timestamps
    end
  end
end
