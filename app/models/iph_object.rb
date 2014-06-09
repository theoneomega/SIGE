class IphObject < ActiveRecord::Base
  attr_accessible :amount, :description, :id, :object
  has_many :iph_iph_objects
  validates :object, :presence =>  {:message => 'debes introducir el nombre del objeto'}
  validates :description, :presence =>  {:message => 'debes introducir una descripcion'}
  validates :amount, :presence =>  {:message => 'debes introducir la cantidad'}
  
  audited
  def obj_description
    self.amount.to_s + " "+self.object + " "+self.description
  end
end
