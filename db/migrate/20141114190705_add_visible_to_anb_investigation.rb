class AddVisibleToAnbInvestigation < ActiveRecord::Migration
  def change
    add_column :anb_investigations, :visible, :boolean
  end
end
