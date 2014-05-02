class AddSearchableToColaborations < ActiveRecord::Migration
  def change
    add_column :colaborations, :searchable, :text
  end
end
