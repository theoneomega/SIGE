class AddLastUserUpdateToColaborations < ActiveRecord::Migration
  def change
    add_column :colaborations, :user_id, :integer
  end
end
