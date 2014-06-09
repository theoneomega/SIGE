class CreateClicksActivities < ActiveRecord::Migration
  def change
    create_table :clicks_activities do |t|
      t.integer :id
      t.integer :user_id

      t.timestamps
    end
  end
end
