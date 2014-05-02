class AddOfficeNumberToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :received_office_number, :string
  end
end
