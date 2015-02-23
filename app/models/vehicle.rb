class Vehicle < ActiveRecord::Base
  attr_accessible :brand, :color, :details, :id, :line, :model, :person_id, :serial_number, :status, :stolen, :plate
  attr_accessible :fulldescription, :people_attributes, :registered_from
  belongs_to :person
  has_many :event_vehicles, :dependent => :destroy
  has_many :criminal_vehicle, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :colaboration_vehicles, :dependent => :destroy
  has_many :office_vehicle, :dependent => :destroy
  
  
  audited
  validates :brand, :presence => true #{:message => 'Debes introducir "Marca"'}
  validates :line, :presence => true # {:message => 'Debes introducir "Linea"'}
  
  def fulldescription
    self.brand + " " + self.line + " " + self.model.to_s 
  end
  
end
