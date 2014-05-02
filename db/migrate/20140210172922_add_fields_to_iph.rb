class AddFieldsToIph < ActiveRecord::Migration
  def change
    add_column :iphs, :vialidad, :boolean
    add_column :iphs, :investigadora, :boolean
    add_column :iphs, :peup, :boolean
  end
end
