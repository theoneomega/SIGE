class CreateEventPhones < ActiveRecord::Migration
  def change
    create_table :event_phones do |t|
      t.integer :event_id
      t.integer :phone_id

      t.timestamps
    end
  end
end
