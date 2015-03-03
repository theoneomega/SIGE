class Assignment < ActiveRecord::Base
  attr_accessible :id, :user_id, :user_type, :role_id
  belongs_to :user, :polymorphic => true
  belongs_to :role
end