class CreateIphImages < ActiveRecord::Migration
  def change
    create_table :iph_images do |t|
      t.integer :id
      t.integer :iph_id
      t.string :name

      t.timestamps
    end
  end
end
