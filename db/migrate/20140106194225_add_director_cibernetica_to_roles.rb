class AddDirectorCiberneticaToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :director_cibernetico, :boolean
  end
end
