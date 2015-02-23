class CreateHistoricalArchives < ActiveRecord::Migration
  def change
    create_table :historical_archives do |t|
      t.string :route
      t.text :content

      t.timestamps
    end
  end
end
