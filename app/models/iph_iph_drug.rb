class IphIphDrug < ActiveRecord::Base
  attr_accessible :iph_drug_id, :iph_id
  belongs_to :iph
  belongs_to :iph_drug
  audited
end
