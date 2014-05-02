class AddIphIdToIphWeapons < ActiveRecord::Migration
  def change
    add_column :iph_weapons, :iph_id, :integer
  end
end
