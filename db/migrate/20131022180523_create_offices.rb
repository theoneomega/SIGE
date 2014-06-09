class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.integer :id
      t.date :office_date
      t.date :received_date
      t.string :requesting_area
      t.string :claimant
      t.string :subject
      t.integer :area_id
      t.integer :status_id
      t.integer :analyst_id
      t.date :replied_date
      t.string :office_number
      t.text :observations
      t.integer :user_id

      t.timestamps
    end
  end
end
