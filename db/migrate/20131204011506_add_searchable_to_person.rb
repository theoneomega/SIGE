class AddSearchableToPerson < ActiveRecord::Migration
  def change
    add_column :people, :searchable, :text
  end
end
