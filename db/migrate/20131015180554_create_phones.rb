class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :id
      t.string :phone_number
      t.string :registered_from

      t.timestamps
    end
  end
end
