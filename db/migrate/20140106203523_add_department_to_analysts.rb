class AddDepartmentToAnalysts < ActiveRecord::Migration
  def change
    add_column :analysts, :department, :string
  end
end
