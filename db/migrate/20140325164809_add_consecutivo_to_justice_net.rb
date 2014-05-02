class AddConsecutivoToJusticeNet < ActiveRecord::Migration
  def change
    add_column :justice_nets, :consecutivo, :string
  end
end
