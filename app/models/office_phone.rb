class OfficePhone < ActiveRecord::Base
  attr_accessible :office_id, :phone_id
  belongs_to :office
  belongs_to :phone
  audited
  validates_uniqueness_of :office_id, :scope => :phone_id
end
