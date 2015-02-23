class ColaborationCollectionController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @colaboration_collection = Colaboration.order('id ASC').paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end
end
