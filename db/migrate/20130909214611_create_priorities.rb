class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.integer :id
      t.string :description

      t.timestamps
    end
  end
end
