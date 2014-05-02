class AddSupervisorToAnalysts < ActiveRecord::Migration
  def change
    add_column :analysts, :zone_supervisor, :boolean
  end
end
