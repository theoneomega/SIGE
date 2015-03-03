class Helpdesk < ActiveRecord::Base
  attr_accessible :active, :analyst_id, :description, :problem
  belongs_to :analyst
  has_many :helpdesk_actions, :dependent => :destroy
  has_many :helpdesk_screenshots, :dependent => :destroy

end
