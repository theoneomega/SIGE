class AddRegisteredFromToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :registered_from, :string
  end
end
