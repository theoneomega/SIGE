class Helpdesk < ActiveRecord::Base
  attr_accessible :active, :analyst_id, :description, :problem
end
