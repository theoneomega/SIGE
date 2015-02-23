class CreateEventPeople < ActiveRecord::Migration
  def change
    create_table :event_people do |t|
      t.integer :event_id
      t.integer :person_id

      t.timestamps
    end
  end
end
