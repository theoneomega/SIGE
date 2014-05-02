class CreateJusticeNetFiles < ActiveRecord::Migration
  def change
    create_table :justice_net_files do |t|
      t.integer :id
      t.integer :justice_net_id
      t.string :name

      t.timestamps
    end
  end
end
