class HistoricalArchivesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @search_file = HistoricalArchive.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 500
    end

    if params[:buscar]
      @historical_archives = @search_file.results
    else
      @historical_archives = {}
    end
  end
end
