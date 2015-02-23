class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :id
      t.string :role
      t.boolean :protected
      t.boolean :super_admin
      t.boolean :analyst
      t.boolean :administrator
      t.boolean :supervisor

      t.timestamps
    end
  end
end
