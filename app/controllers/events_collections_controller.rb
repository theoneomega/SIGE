class EventsCollectionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /events_collections
  # GET /events_collections.json
  

  def index
    @search = Event.search do
      fulltext params[:search] 
#      paginate :page => params[:page], :per_page => 7
    end
    @events_collection = @search.results
    
    @json = @search.results.to_gmaps4rails
  end



  # GET /events_collections/1
  # GET /events_collections/1.json
  def show
    @events_collection = EventsCollection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @events_collection }
    end
  end

  # GET /events_collections/new
  # GET /events_collections/new.json
  def new
    @events_collection = EventsCollection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @events_collection }
    end
  end

  # GET /events_collections/1/edit
  def edit
    @events_collection = EventsCollection.find(params[:id])
  end

  # POST /events_collections
  # POST /events_collections.json
  def create
    @events_collection = EventsCollection.new(params[:events_collection])

    respond_to do |format|
      if @events_collection.save
        format.html { redirect_to @events_collection, notice: 'Events collection was successfully created.' }
        format.json { render json: @events_collection, status: :created, location: @events_collection }
      else
        format.html { render action: "new" }
        format.json { render json: @events_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events_collections/1
  # PUT /events_collections/1.json
  def update
    @events_collection = EventsCollection.find(params[:id])

    respond_to do |format|
      if @events_collection.update_attributes(params[:events_collection])
        format.html { redirect_to @events_collection, notice: 'Events collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @events_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events_collections/1
  # DELETE /events_collections/1.json
  def destroy
    @events_collection = EventsCollection.find(params[:id])
    @events_collection.destroy

    respond_to do |format|
      format.html { redirect_to events_collections_url }
      format.json { head :no_content }
    end
  end
end
