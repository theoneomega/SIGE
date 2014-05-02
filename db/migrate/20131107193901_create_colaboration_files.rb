class CreateColaborationFiles < ActiveRecord::Migration
  def change
    create_table :colaboration_files do |t|
      t.integer :id
      t.string :file
      t.text :description
      t.integer :colaboration_id

      t.timestamps
    end
  end
end
