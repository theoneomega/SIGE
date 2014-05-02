class CreateIphWeapons < ActiveRecord::Migration
  def change
    create_table :iph_weapons do |t|
      t.integer :id
      t.string :brand
      t.string :model
      t.string :serial_number
      t.string :weapon
      t.string :caliber
      t.integer :weapon_type_id

      t.timestamps
    end
  end
end
