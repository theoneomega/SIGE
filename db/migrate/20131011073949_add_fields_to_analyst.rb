class AddFieldsToAnalyst < ActiveRecord::Migration
  def change
    add_column :analysts, :first_name, :string
    add_column :analysts, :last_name1, :string
    add_column :analysts, :last_name2, :string
    add_column :analysts, :area_id, :integer
  end
end
