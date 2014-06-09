class CreateIphIphObjects < ActiveRecord::Migration
  def change
    create_table :iph_iph_objects do |t|
      t.integer :iph_id
      t.integer :iph_object_id

      t.timestamps
    end
  end
end
