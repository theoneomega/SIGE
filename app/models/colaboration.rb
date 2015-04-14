class Colaboration < ActiveRecord::Base
  audited
  attr_accessible :analyst_id, :area_id, :claimant, :colaboration_date, :id, :observations, :colaboration_areas_id, :colaboration_areas_attributes
  attr_accessible :received_for, :replied_for, :reply_date, :requesting_area, :status_id, :email, :person_attributes, :phones_attributes, :colaboration_file_attributes,:vehicles_attributes
  attr_accessible :weapons_attributes, :dieid, :cibernetica
  belongs_to :area
  belongs_to :status
  belongs_to :analyst
  has_many :person, :through => :colaboration_person, :dependent => :destroy
  has_many :colaboration_person, :dependent => :destroy
  has_many :vehicles, :through => :colaboration_vehicles
  has_many :colaboration_vehicles, :dependent => :destroy
  has_many :weapons, :through => :colaboration_weapons
  has_many :colaboration_weapons, :dependent => :destroy
  belongs_to :user
  has_many :colaboration_phone, :dependent => :destroy
  has_many :phones, :through => :colaboration_phone, :dependent => :destroy
  has_many :colaboration_file, :dependent => :destroy

  validates :area_id, :presence => true
  validates :status_id, :presence => true
  validates :colaboration_date, :presence => true #{ :message => "Debes introducir la fecha de la colaboracion"}

  accepts_nested_attributes_for :person, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :vehicles, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :weapons, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank

  accepts_nested_attributes_for :colaboration_file, :allow_destroy => true, :reject_if => :all_blank

  self.per_page =10

  def analista
    self.analyst.analyst if self.analyst
  end

  def publish_month
    I18n.l colaboration_date, :format => "%B %Y"
  end
  def vehicle_brand
    vehicles.map(&:brand)
  end

  def vehicle_details
    vehicles.map(&:details)
  end
  def area_description
    self.area.description
  end

  searchable do
    text :searchable, :claimant, :observations, :replied_for, :received_for,
         :email, :requesting_area, :publish_month, :vehicle_details, :vehicle_brand, :analista, :area_description
    time :colaboration_date

    text :person do
      person.map(&:fullname)
    end
    text :last_name do
      person.map(&:last_name2)
    end

    text :persondescription do
      person.map(&:observations)
    end
    #    text :analyst do
    #      analyst.analyst
    #    end
  end
end
