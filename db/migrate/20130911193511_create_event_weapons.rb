class CreateEventWeapons < ActiveRecord::Migration
  def change
    create_table :event_weapons do |t|
      t.integer :event_id
      t.integer :weapon_id

      t.timestamps
    end
  end
end
