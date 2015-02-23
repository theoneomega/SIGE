class CreateIphObjects < ActiveRecord::Migration
  def change
    create_table :iph_objects do |t|
      t.integer :id
      t.integer :amount
      t.string :object
      t.text :description

      t.timestamps
    end
  end
end
