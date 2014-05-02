class IphVehicle < ActiveRecord::Base
  attr_accessible :brand, :color, :details, :id, :line, :model, :plate, :serial_number, :stolen
  has_many :iph_iph_vehicles
  
  validates :brand, :presence => {:message => 'Debes introducir "Marca"'}
  validates :line, :presence => {:message => 'Debes introducir "Linea"'}
  audited
  def fulldescription
    self.brand + " " + self.line + " " + self.model.to_s
  end
  
end
