class SearchesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /searches
  # GET /searches.json
  def index

      @investigations_search = Investigation.search do
        fulltext params[:search1]
        if params[:date].present?
          with(:start_date).greater_than(params[:date].to_time)
        end
        if params[:date_end].present?
          with(:start_date).less_than(params[:date_end].to_time+1.day)
        end
        paginate :page => 1, :per_page => 999
      end
      @investigation = @investigations_search.results


      @search_nusticianet = JusticeNet.search do
        fulltext params[:search1]
        if params[:date].present?
          with(:received_date).greater_than(params[:date].to_time)
        end
        if params[:date_end].present?
          with(:received_date).less_than(params[:date_end].to_time+1.day)
        end
        paginate :page => 1, :per_page => 999
      end
      @justicia_net = @search_nusticianet.results
      @search_offices = Office.search do
        fulltext params[:search1]
        if params[:date].present?
          with(:office_date).greater_than(params[:date].to_time)
        end
        if params[:date_end].present?
          with(:office_date).less_than(params[:date_end].to_time+1.day)
        end
        paginate :page => 1, :per_page => 999
      end
      @officessearch = @search_offices.results
      @search_colaborations = Colaboration.search do
        fulltext params[:search1]
        if params[:date].present?
          with(:colaboration_date).greater_than(params[:date].to_time)
        end
        if params[:date_end].present?
          with(:colaboration_date).less_than(params[:date_end].to_time+1.day)
        end
        paginate :page => 1, :per_page => 999
      end
      @colaborationsearch = @search_colaborations.results


      @search_events = Event.search do
        fulltext params[:search1]
        if params[:date].present?
          with(:event_date).greater_than(params[:date].to_time)
        end
        if params[:date_end].present?
          with(:event_date).less_than(params[:date_end].to_time+1.day)
        end
        paginate :page => params[:page], :per_page => 999
      end
      @searches = @search_events.results
      @json = @search_events.results.to_gmaps4rails

    



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(params[:search])

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = Search.find(params[:id])

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end
end
