class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :id
      t.string :description

      t.timestamps
    end
  end
end
