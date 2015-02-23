class AddTramoCarreteroToEvent < ActiveRecord::Migration
  def change
    add_column :events, :tramo_carretero, :string
  end
end
