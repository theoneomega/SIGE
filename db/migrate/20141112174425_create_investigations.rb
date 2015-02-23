class CreateInvestigations < ActiveRecord::Migration
  def change
    create_table :investigations do |t|
      t.string :folio
      t.string :ci
      t.string :penal_cause
      t.string :title
      t.date :start_date
      t.boolean :visible
      t.text :hide_reason

      t.timestamps
    end
  end
end
