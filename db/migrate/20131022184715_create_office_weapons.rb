class CreateOfficeWeapons < ActiveRecord::Migration
  def change
    create_table :office_weapons do |t|
      t.integer :weapon_id
      t.integer :office_id

      t.timestamps
    end
  end
end
