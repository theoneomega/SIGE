class IphPerson < ActiveRecord::Base
  attr_accessible :alias, :birth_date, :ci, :first_name, :genre, :id, :last_name1
  attr_accessible :last_name2, :observations, :originative, :profession, :record, :status_id, :iph_id
  belongs_to :status
  
audited
  
  validates :first_name, :presence => {:message => 'debes introducir nombre'}
  validates :last_name1, :presence => {:message => 'debes introducir apellido'}
  validates :status_id, :presence => {:message => 'debes seleccionar estatus de la persona'}
  
  def fullname
    first_name.titlecase + " " + last_name1.titlecase 
  end
  
  self.per_page = 10
end
