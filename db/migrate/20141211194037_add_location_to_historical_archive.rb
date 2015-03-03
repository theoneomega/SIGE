class AddLocationToHistoricalArchive < ActiveRecord::Migration
  def change
    add_column :historical_archives, :location, :string
  end
end
