class Analyst < ActiveRecord::Base
  attr_accessible :analyst, :id, :first_name, :last_name1, :last_name2, :area_id, :zone_supervisor, :fullname,:department
  has_many :events, :dependent => :destroy
  has_many :person, through: :events
  has_one :user
  belongs_to :area
  has_many :colaborations
  has_many :offices
  has_many :justice_nets
  has_many :investigations
  self.per_page = 10
  def fullname
    first_name + " " + last_name1 + " " + last_name2
  end
end
