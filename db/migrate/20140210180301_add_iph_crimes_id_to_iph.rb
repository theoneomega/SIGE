class AddIphCrimesIdToIph < ActiveRecord::Migration
  def change
    add_column :iphs, :iph_crime_id, :integer
    add_column :iphs, :crime_id, :integer
  end
end
