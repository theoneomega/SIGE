class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.integer :id
      t.string :description

      t.timestamps
    end
  end
end
