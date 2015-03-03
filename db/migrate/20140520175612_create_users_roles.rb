class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles, :id => false do |t|
      t.references :role, :user
    end
  end
end
