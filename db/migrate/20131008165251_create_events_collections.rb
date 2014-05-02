class CreateEventsCollections < ActiveRecord::Migration
  def change
    create_table :events_collections do |t|
      t.integer :id
      t.integer :priority_id
      t.date :event_date
      t.text :description
      t.string :street
      t.string :interior_number
      t.string :suburb
      t.string :locality
      t.integer :person_id
      t.integer :vehicle_id
      t.integer :drug_id
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

      t.timestamps
    end
  end
end
