class AddCiberneticaToColaborations < ActiveRecord::Migration
  def change
    add_column :colaborations, :cibernetica, :boolean
    add_column :colaborations, :DIEID, :boolean
  end
end
