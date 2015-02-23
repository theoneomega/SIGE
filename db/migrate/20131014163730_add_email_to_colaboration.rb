class AddEmailToColaboration < ActiveRecord::Migration
  def change
    add_column :colaborations, :email, :string
  end
end
