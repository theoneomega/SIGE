class UsersInformationController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @bitacora= Activity.order('last_activity desc')
  end
  
  
end
