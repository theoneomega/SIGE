class CreateColaborationWeapons < ActiveRecord::Migration
  def change
    create_table :colaboration_weapons do |t|
      t.integer :colaboration_id
      t.integer :weapon_id

      t.timestamps
    end
  end
end
