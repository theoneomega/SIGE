class AddIphIdToIphObjects < ActiveRecord::Migration
  def change
    add_column :iph_objects, :iph_id, :integer
  end
end
