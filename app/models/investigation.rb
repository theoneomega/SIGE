class Investigation < ActiveRecord::Base
  attr_accessible :ci, :folio, :hide_reason, :penal_cause, :start_date, :title, :visible, :analyst_id, :id
  has_many :pdf_investigations
  belongs_to :analyst

  validates :title, :start_date, :presence => true
  before_save :def_folio


  def def_folio
    self.folio = "#{self.id}-#{self.start_date.year.to_s}"
  end

  searchable do
    text :penal_cause, :title, :ci
    text :pdf do
      pdf_investigations(&:pdf_content)
    end
  end
end
