class EventsCollection < ActiveRecord::Base
  attr_accessible :analyst_id, :area_id, :backup_file, :crime_id, :description, :detained, :drug_id, :drugs, :event_date, :id
  attr_accessible :locality, :locality_id, :observations, :person_id, :place_id, :priority_id, :source, :status_id, :address
  attr_accessible :suburb, :suspects, :township_id, :vehicle_id, :vehicles, :victims, :weapon_id, :weapons
  attr_accessible :person_attributes,:weapons_attributes, :backup_files_attributes, :vehicles_attributes, :phones_attributes
  attr_accessible :latitude, :longitude, :gmaps
  acts_as_gmappable
  
  def gmaps4rails_address
    self.address+", Chihuahua, Mexico"
  end
  
  belongs_to :priority
  belongs_to :crime
  has_many :event_person, :dependent => :destroy
  has_many :person, :through => :event_person
  has_many :vehicles, :through => :event_vehicles
  has_many :event_vehicles, :dependent => :destroy
  has_many :event_drugs, :dependent => :destroy
  has_many :drug, :through => :event_drugs
  has_many :weapons, :through => :event_weapons
  has_many :event_weapons, :dependent => :destroy
  belongs_to :area
  belongs_to :status
  belongs_to :analyst 
  belongs_to :township
  belongs_to :place
  belongs_to :locality
  
  validates :priority, :presence => true
  validates :description, :presence => true
  validates :area_id, :presence => true
  validates :locality, :presence => true
  validates :analyst_id, :presence =>true
  
  accepts_nested_attributes_for :person, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :vehicles, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :drug, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :weapons, :allow_destroy => true, :reject_if => :all_blank
  
  
  
  def gmaps4rails_infowindow
    "<h4>Evento #{id}</h4>" << "<h4>#{self.address}</h4>"
  end
end
