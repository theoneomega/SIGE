class ClicksActivity < ActiveRecord::Base
  attr_accessible :id, :user_id
  belongs_to :user
  audited
end
