class CreateAnalysts < ActiveRecord::Migration
  def change
    create_table :analysts do |t|
      t.integer :id
      t.string :analyst

      t.timestamps
    end
  end
end
