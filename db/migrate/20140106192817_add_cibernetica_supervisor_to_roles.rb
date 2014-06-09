class AddCiberneticaSupervisorToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :supervisor_cibernetico, :boolean
  end
end
