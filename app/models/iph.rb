class Iph < ActiveRecord::Base
  attr_accessible  :description, :folio, :id, :iph_date,  :observations
  attr_accessible :office_number,  :searchable,   :user_id, :state
  attr_accessible :iph_person_attributes   
  attr_accessible :vialidad, :investigadora, :peup, :iph_crime_id, :crime_id
  belongs_to :user
  belongs_to :iph_crime
  belongs_to :crime
  
  has_many :iph_person, :dependent => :destroy
  
  audited
  
  accepts_nested_attributes_for :iph_person, :allow_destroy => true, :reject_if => :all_blank
  
  def publish_month
    I18n.l iph_date, :format => "%B %Y"
  end
  
  searchable do
    text :description, :folio, :publish_month, :observations, :office_number, :state
    time :iph_date
    
    text :person do
      iph_person.map(&:fullname)
    end
    text :last_name do
      iph_person.map(&:last_name2)
    end
    text :persondescription do
      iph_person.map(&:observations)
    end
    
    text :ocupation do
      iph_person.map(&:profession)
    end
    text :originative do
      iph_person.map(&:originative)
    end
  end
  
end
