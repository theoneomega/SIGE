class AddFileToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :file, :string
  end
end
