class AddIphIdToIphDrugs < ActiveRecord::Migration
  def change
    add_column :iph_drugs, :iph_id, :integer
  end
end
