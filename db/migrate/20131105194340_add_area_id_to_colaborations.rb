class AddAreaIdToColaborations < ActiveRecord::Migration
  def change
    add_column :colaborations, :colaboration_areas_id, :integer
  end
end
