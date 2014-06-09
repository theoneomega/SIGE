class AddPriorityToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :priority_id, :integer
  end
end
