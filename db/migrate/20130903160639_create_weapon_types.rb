class CreateWeaponTypes < ActiveRecord::Migration
  def change
    create_table :weapon_types do |t|
      t.integer :id
      t.string :desc

      t.timestamps
    end
  end
end
