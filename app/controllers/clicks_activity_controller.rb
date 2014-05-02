class ClicksActivityController < ApplicationController
 before_filter :authenticate_user!
  load_and_authorize_resource
  def new
    @clicks = ClicksActivity.new
  end
  
  
  def create
    @clicks = ClicksActivity.new(params[:clicks])
    @clicks.save
  end
  

end