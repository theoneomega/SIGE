class IphDrug < ActiveRecord::Base
  attr_accessible :id, :kind, :observations, :quantity
  audited
  validates :kind, :presence =>  {:message => 'debes introducir tipo de droga'}
end
