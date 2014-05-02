class JusticeNet < ActiveRecord::Base
  attr_accessible :analyst_id, :id, :justicia_net_folio, :observations, :received_date, :replied_date
  attr_accessible :person_attributes, :justice_net_files_attributes, :status_id, :area_id, :consecutivo
  validates :justicia_net_folio, :presence => true
  validates :received_date, :presence => true  
  
  has_many :justice_person, :dependent => :destroy
  has_many :person, :through => :justice_person
  has_many :justice_net_files, :dependent => :destroy
  belongs_to :status
  belongs_to :analyst
  belongs_to :area
  audited
  
  
  accepts_nested_attributes_for :person, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :justice_net_files, :allow_destroy => true, :reject_if => :all_blank
  
  searchable do
    text :justicia_net_folio, :observations
#    text :analista_asignado
    time :received_date
    
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
  self.per_page = 10
end
