class CreateOfficePhones < ActiveRecord::Migration
  def change
    create_table :office_phones do |t|
      t.integer :phone_id
      t.integer :office_id

      t.timestamps
    end
  end
end
