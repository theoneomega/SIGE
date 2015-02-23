class AddSearchableToEvent < ActiveRecord::Migration
  def change
    add_column :events, :searchable, :text
  end
end
