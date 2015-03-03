class CreateHelpdeskActions < ActiveRecord::Migration
  def change
    create_table :helpdesk_actions do |t|
      t.integer :helpdesk_id
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
