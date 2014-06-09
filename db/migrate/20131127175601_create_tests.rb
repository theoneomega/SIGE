class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :id
      t.text :description
      t.date :date_file

      t.timestamps
    end
  end
end
