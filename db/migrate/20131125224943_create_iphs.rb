class CreateIphs < ActiveRecord::Migration
  def change
    create_table :iphs do |t|
      t.integer :id
      t.integer :priority_id
      t.date :iph_date
      t.string :folio
      t.string :office_number
      t.text :description
      t.string :address
      t.string :suburb
      t.integer :locality_id
      t.integer :state_id
      t.string :tramo_carretero
      t.text :observations
      t.text :searchable
      t.integer :user_id

      t.timestamps
    end
  end
end
