class CreateIphIphPeople < ActiveRecord::Migration
  def change
    create_table :iph_iph_people do |t|
      t.integer :iph_id
      t.integer :iph_person_id

      t.timestamps
    end
  end
end
