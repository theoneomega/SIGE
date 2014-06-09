class CreateIphIphDrugs < ActiveRecord::Migration
  def change
    create_table :iph_iph_drugs do |t|
      t.integer :iph_id
      t.integer :iph_drug_id

      t.timestamps
    end
  end
end
