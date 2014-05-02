class Activity < ActiveRecord::Base
  attr_accessible :id, :user_id, :last_activity
  belongs_to :user
end