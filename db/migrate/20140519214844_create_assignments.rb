class CreateAssignments < ActiveRecord::Migration

  create_table(:assignments) do |t|
    t.references :user, :polymorphic => true
    t.references :role
  end
  add_index(:assignments, [ :user_id, :user_type ])

end