class AddAnalystNumberToAnbInvestigation < ActiveRecord::Migration
  def change
    add_column :anb_investigations, :analyst_number, :string
  end
end
