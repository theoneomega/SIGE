class AddAnalystToInvestigations < ActiveRecord::Migration
  def change
    add_column :investigations, :analyst_id, :integer
  end
end
