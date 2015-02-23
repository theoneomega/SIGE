class CreateCriminalDrugs < ActiveRecord::Migration
  def change
    create_table :criminal_drugs do |t|
      t.integer :criminal_group_id
      t.integer :drug_id

      t.timestamps
    end
  end
end
