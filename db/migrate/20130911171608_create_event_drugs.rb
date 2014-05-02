class CreateEventDrugs < ActiveRecord::Migration
  def change
    create_table :event_drugs do |t|
      t.integer :event_id
      t.integer :drug_id

      t.timestamps
    end
  end
end
