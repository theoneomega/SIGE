class CreateColaborationPhones < ActiveRecord::Migration
  def change
    create_table :colaboration_phones do |t|
      t.integer :phone_id
      t.integer :colaboration_id

      t.timestamps
    end
  end
end
