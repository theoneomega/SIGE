class AddRoleToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :super_supervisor, :boolean
  end
end
