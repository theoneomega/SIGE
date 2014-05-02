class CreateOfficePeople < ActiveRecord::Migration
  def change
    create_table :office_people do |t|
      t.integer :person_id
      t.integer :office_id

      t.timestamps
    end
  end
end
