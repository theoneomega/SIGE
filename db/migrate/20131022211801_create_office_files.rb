class CreateOfficeFiles < ActiveRecord::Migration
  def change
    create_table :office_files do |t|
      t.integer :id
      t.integer :office_id
      t.string :file
      t.string :description

      t.timestamps
    end
  end
end
