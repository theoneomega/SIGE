class Audit < ActiveRecord::Base
  attr_accessible :description, :id, :status_type, :detail, :auditable_id, :auditable_type, :associated_id, :associated_type, :user_id
end
