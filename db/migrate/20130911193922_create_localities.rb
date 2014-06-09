class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.integer :id
      t.integer :township_id
      t.string :locality

      t.timestamps
    end
  end
end
