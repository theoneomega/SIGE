class Office < ActiveRecord::Base
  attr_accessible :analyst_id, :area_id, :claimant, :id, :observations, :office_date, :person_attributes, :received_office_number, :priority_id
  attr_accessible :office_number, :received_date, :replied_date, :requesting_area, :status_id, :subject, :user_id, :office_file_attributes, :weapons_attributes
  attr_accessible :phones_attributes, :vehicles_attributes, :created_at, :kind
  audited
  belongs_to :area
  belongs_to :status
  belongs_to :analyst 
  belongs_to :priority
  has_many :person, :through => :office_person, :dependent => :destroy
  has_many :weapons, :through => :office_weapon, :dependent => :destroy
  has_many :vehicles, :through => :office_vehicle, :dependent => :destroy
  has_many :phones, :through => :office_phone, :dependent => :destroy
  
  has_many :office_file, :dependent => :destroy
  
  has_many :office_person, :dependent => :destroy
  has_many :office_vehicle, :dependent => :destroy
  has_many :office_weapon, :dependent => :destroy
  has_many :office_phone, :dependent => :destroy
  
  belongs_to :user
  
  validates :area_id, :presence => true
  validates :status_id, :presence => true #{:message =>"Estatus no puede estar en blanco"}
  validates :priority_id, :presence => true
  validates :received_date, :presence => true
  validates :office_date, :presence => true
  
  accepts_nested_attributes_for :person, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :vehicles, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :weapons, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank
  
  accepts_nested_attributes_for :office_file, :allow_destroy => true, :reject_if => :all_blank
  
  def publish_month
    I18n.l office_date, :format => "%B %Y"
  end
   def vehicle_brand
    vehicles.map(&:brand)
  end
  def analista
    self.analyst.analyst if self.analyst
  end


  def vehicle_details
    vehicles.map(&:details)
  end
  
  def area_oficio
    area.description
  end
  
  searchable do
    text :claimant, :observations,
         :analista, :requesting_area, :received_office_number, :subject,
         :office_number, :publish_month, :vehicle_brand, :vehicle_details, :area_oficio
#    text :analista_asignado
    time :office_date
    
    text :person do
      person.map(&:fullname)
    end
    text :last_name do
      person.map(&:last_name2)
    end
    
    text :persondescription do
      person.map(&:observations)
    end
    
  end
end
