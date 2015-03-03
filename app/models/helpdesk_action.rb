class HelpdeskAction < ActiveRecord::Base
  attr_accessible :description, :helpdesk_id, :user_id
  belongs_to :helpdesk
  belongs_to :user
end
