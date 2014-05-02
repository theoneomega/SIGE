class CreateColaborationAreas < ActiveRecord::Migration
  def change
    create_table :colaboration_areas do |t|
      t.integer :id
      t.string :area

      t.timestamps
    end
  end
end
