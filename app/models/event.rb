class Event < ActiveRecord::Base
  attr_accessible :analyst_id, :area_id, :backup_file, :crime_id, :description, :detained, :drug_id, :drugs, :event_date, :id
  attr_accessible :locality, :locality_id, :observations, :person_id, :place_id, :priority_id, :source, :status_id, :address
  attr_accessible :suburb, :suspects, :township_id, :vehicle_id, :vehicles, :victims, :weapon_id, :weapons
  attr_accessible :person_attributes,:weapons_attributes, :backup_files_attributes, :vehicles_attributes, :phones_attributes
  attr_accessible :latitude, :longitude, :gmaps, :tramo_carretero, :searchable, :created_at, :person_count
  acts_as_gmappable :process_geocoding => false
  
  def gmaps4rails_address
    "#{self.address}, chihuahua"
  end

  audited

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
  has_many :backup_files, :dependent => :destroy
  has_many :event_phone, :dependent => :destroy
  has_many :phones, :through => :event_phone, :dependent => :destroy
  belongs_to :area
  belongs_to :status
  belongs_to :analyst 
  belongs_to :township
  belongs_to :place
  belongs_to :locality


  
  validates :priority_id, :presence => true# { :message => "Debes seleccionar una prioridad"} 
  validates :description, :presence =>  true#{ :message => "Debes agregar una descripcion" }
  validates :area_id, :presence =>  true#{ :message => "Debes seleccionar el area del evento" }
  validates :crime_id, :presence =>true# { :message => "Debes seleccionar el delito" } 
  validates :event_date, :presence => true
  # validates :status_id, :presence => true
  
  accepts_nested_attributes_for :person, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :vehicles, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :drug, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :weapons, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :backup_files, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank
  
  
  def gmaps4rails_infowindow
    "<h5>Delito:\n\ #{self.crime.crime}</h5>"  << "<i>#{self.description}</i>"
  end
  
  def publish_month
    I18n.l created_at, :format => "%B %Y"
  end
  
  def vehicle_brand
    vehicles.map(&:brand)
  end

  def vehicle_details
    vehicles.map(&:details)
  end
  
  def estatus
    self.status.description
  end
  
  def vehicle_line
    vehicles.map(&:line)
  end
  def vehicle_serial
    vehicles.map(&:serial_number)
  end
  def vehicle_plate
    vehicles.map(&:plate)
  end

  def analista
    self.analyst.analyst if self.analyst
  end
  
  searchable do
    text :searchable, :observations, :vehicle_id, :publish_month, :vehicle_brand, :vehicle_details
    text :vehicle_plate, :vehicle_line, :vehicle_serial, :estatus, :analista
    time :event_date
    
    text :person do
      person.map(&:fullname)
    end
    text :persondescription do
      person.map(&:observations)
    end
    text :last_name do
      person.map(&:last_name2)
    end
    
    
    #    text :analyst_code do
    #      analyst.map(&:analyst)
    #    end
  end
  
  #  def person_observations 
  #    self.person.observations
  #  end

  
 
end
