class AddFieldToPerson < ActiveRecord::Migration
  def change
    add_column :people, :registered_from, :string
  end
end
