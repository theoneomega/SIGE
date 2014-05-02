class AddConfirmableToUser < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :date
    add_column :users, :confirmation_sent_at, :date
  end
end
