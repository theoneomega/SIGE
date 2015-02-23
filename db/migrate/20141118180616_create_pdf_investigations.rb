class CreatePdfInvestigations < ActiveRecord::Migration
  def change
    create_table :pdf_investigations do |t|
      t.string :pdf
      t.string :pdf_content_type
      t.integer :pdf_file_size
      t.date :pdf_updated_at
      t.integer :investigation_id
      t.integer :analyst_id
      t.boolean :visible
      t.string :analyst_number
      t.text :pdf_content

      t.timestamps
    end
  end
end
