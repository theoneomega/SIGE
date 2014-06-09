class CreateCriminalGroups < ActiveRecord::Migration
  def change
    create_table :criminal_groups do |t|
      t.integer :id
      t.text :description
      t.integer :vehicle_id
      t.integer :weapon_id
      t.integer :drug_id
      t.integer :area_id

      t.timestamps
    end
  end
end
