class CreateJusticePeople < ActiveRecord::Migration
  def change
    create_table :justice_people do |t|
      t.integer :person_id
      t.integer :justice_net_id

      t.timestamps
    end
  end
end
