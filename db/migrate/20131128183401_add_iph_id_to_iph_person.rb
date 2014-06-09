class AddIphIdToIphPerson < ActiveRecord::Migration
  def change
    add_column :iph_people, :iph_id, :integer
  end
end
