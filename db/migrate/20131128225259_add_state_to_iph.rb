class AddStateToIph < ActiveRecord::Migration
  def change
    add_column :iphs, :state, :string
  end
end
