class CreatePersonPhones < ActiveRecord::Migration
  def change
    create_table :person_phones do |t|
      t.integer :person_id
      t.integer :phone_id

      t.timestamps
    end
  end
end
