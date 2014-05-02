class CreateColaborations < ActiveRecord::Migration
  def change
    create_table :colaborations do |t|
      t.integer :id
      t.date :colaboration_date
      t.string :received_for
      t.string :requesting_area
      t.string :claimant
      t.integer :status_id
      t.integer :area_id
      t.integer :analyst_id
      t.date :reply_date
      t.string :replied_for
      t.text :observations

      t.timestamps
    end
  end
end
