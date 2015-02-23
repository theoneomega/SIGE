class CreateJusticeNets < ActiveRecord::Migration
  def change
    create_table :justice_nets do |t|
      t.integer :id
      t.string :justicia_net_folio
      t.date :received_date
      t.integer :analyst_id
      t.text :observations
      t.date :replied_date

      t.timestamps
    end
  end
end
