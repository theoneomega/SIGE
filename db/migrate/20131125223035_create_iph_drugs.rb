class CreateIphDrugs < ActiveRecord::Migration
  def change
    create_table :iph_drugs do |t|
      t.integer :id
      t.string :kind
      t.integer :quantity
      t.text :observations

      t.timestamps
    end
  end
end
