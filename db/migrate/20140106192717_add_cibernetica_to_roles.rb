class AddCiberneticaToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :cibernetico, :boolean
  end
end
