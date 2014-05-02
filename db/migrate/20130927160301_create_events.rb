class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :id
      t.integer :priority_id
      t.date :event_date
      t.text :description
      t.string :address
      t.string :suburb
      t.string :locality
      t.boolean :victims
      t.boolean :detained
      t.boolean :suspects
      t.integer :person_id
      t.boolean :vehicles
      t.integer :vehicle_id
      t.boolean :drugs
      t.string :drug_id
      t.boolean :weapons
      t.integer :weapon_id
      t.text :observations
      t.string :backup_file
      t.string :source
      t.integer :area_id
      t.integer :crime_id
      t.integer :township_id
      t.integer :locality_id
      t.integer :place_id
      t.integer :analyst_id
      t.integer :status_id
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
