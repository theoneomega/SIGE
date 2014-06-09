class CreateColaborationPeople < ActiveRecord::Migration
  def change
    create_table :colaboration_people do |t|
      t.integer :colaboration_id
      t.integer :person_id

      t.timestamps
    end
  end
end
