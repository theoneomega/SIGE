class Role < ActiveRecord::Base
  attr_accessible :administrator, :analyst, :id, :protected, :role, :super_admin, :supervisor, :medios, :ie_supervisor, :analysts_supervisor
  attr_accessible :super_supervisor, :iph, :iph_supervisor, :cibernetico, :supervisor_cibernetico, :director_cibernetico
  has_many :users
end
