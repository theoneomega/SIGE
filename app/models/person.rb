class Person < ActiveRecord::Base
  attr_accessible :alias, :birth_date, :ci, :first_name, :genre, :id, :last_name1
  attr_accessible :last_name2, :observations, :originative, :profession, :record, :status_id, :phones_attributes
  attr_accessible  :fullname, :description, :registered_from, :searchable
  has_many :vehicles, :dependent => :destroy
  belongs_to :status
  has_many :weapons, :dependent => :destroy
  has_many :weapons
  has_many :vehicles
  #nested atributes for events
  has_many :event_person, :dependent => :destroy
  has_many :office_person, :dependent => :destroy
  has_many :person_phone, :dependent => :destroy
  has_many :phones, :through => :person_phone, :dependent => :destroy
  
  audited
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank
  
  validates :first_name, :presence => true#{:message => 'debes introducir nombre'}
  validates :last_name1, :presence => true#{:message => 'debes introducir apellido'}
  validates :status_id, :presence => true#{:message => 'debes introducir un estatus para la persona'}
  
  def fullname
    first_name.titlecase + " " + last_name1.titlecase 
  end
  
  self.per_page = 10
end
