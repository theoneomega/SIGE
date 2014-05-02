class AddRoleIphToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :iph, :boolean
    add_column :roles, :iph_supervisor, :boolean
  end
end
