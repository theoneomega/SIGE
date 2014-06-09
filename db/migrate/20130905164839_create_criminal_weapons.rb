class CreateCriminalWeapons < ActiveRecord::Migration
  def change
    create_table :criminal_weapons do |t|
      t.integer :weapon_id
      t.integer :criminal_group_id

      t.timestamps
    end
  end
end
