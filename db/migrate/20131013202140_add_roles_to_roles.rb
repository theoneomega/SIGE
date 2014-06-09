class AddRolesToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :ie_supervisor, :boolean
    add_column :roles, :analysts_supervisor, :boolean
  end
end
