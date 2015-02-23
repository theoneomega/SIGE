class CreateAnbInvestigations < ActiveRecord::Migration
  def change
    create_table :anb_investigations do |t|
      t.string :anb
      t.string :anb_content_type
      t.integer :anb_file_size
      t.date :anb_updated_at
      t.integer :investigation_id
      t.integer :analyst_id

      t.timestamps
    end
  end
end
