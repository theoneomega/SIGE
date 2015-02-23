class CreateHelpdesks < ActiveRecord::Migration
  def change
    create_table :helpdesks do |t|
      t.string :problem
      t.text :description
      t.integer :analyst_id
      t.boolean :active

      t.timestamps
    end
  end
end
