class AddMediosToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :medios, :boolean
  end
end
