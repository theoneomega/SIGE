class AddLatitudeLongitudeToIph < ActiveRecord::Migration
  def change
    add_column :iphs, :latitude, :decimal
    add_column :iphs, :longitude, :decimal
  end
end
