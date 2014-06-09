class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :id
      t.string :description
      t.string :status_type

      t.timestamps
    end
  end
end
