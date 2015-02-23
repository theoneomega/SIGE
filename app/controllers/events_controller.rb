class EventsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /events
  # GET /events.json
  def index

    #    @search = Event.ransack(params[:q])
    if current_user.role.super_admin==true  || current_user.role.ie_supervisor==true || current_user.role.super_supervisor==true
      @events = Event.where('status_id BETWEEN ? AND ?', 10020,10022).order('priority_id ASC').includes(:crime).includes(:priority).includes(:status).includes(:area).includes(:analyst)
      @json = @events.to_gmaps4rails
    elsif current_user.role.medios==true
      if current_user.analyst.area_id == 10001
        @events = Event.where("status_id = ?", 10020).order('priority_id ASC').includes(:crime).includes(:priority).includes(:status).includes(:area).includes(:analyst)
      elsif current_user.analyst.area_id == 10000
        @events = Event.where("analyst_id = ? AND status_id = ?", current_user.analyst_id,10020).order('priority_id ASC').includes(:crime).includes(:priority).includes(:status).includes(:area).includes(:analyst)
      end
    elsif  current_user.role.supervisor == true
      if current_user.analyst.area_id == 10001
        @events = Event.where('status_id BETWEEN ? AND ? AND area_id BETWEEN ? AND ?', 10020,10022,10001,10003).order('priority_id ASC').includes(:crime).includes(:priority).includes(:status).includes(:area).includes(:analyst)
      elsif current_user.analyst.area_id == 10000
        @events = Event.where('status_id BETWEEN ? AND ? AND area_id = ?', 10020,10022,10000).order('priority_id ASC').includes(:crime).includes(:priority).includes(:status).includes(:area).includes(:analyst)
      end
    else
      @events = Event.where("analyst_id = ? AND status_id BETWEEN ? AND ?", current_user.analyst_id, 10020,10022).order('priority_id ASC').includes(:crime).includes(:priority).includes(:status).includes(:area).includes(:analyst)
      @json = @events.to_gmaps4rails
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }

    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @json=Event.find(params[:id]).to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.latitude = 28.700001
    @event.longitude = -105.966667
    @json = '[{"description":"<h4>Evento 10000</h4><h4>Periferico de la Juventud 4101, Colinas del Sol, Chihuahua</h4>","lat":"28.6352778","lng":"-106.0888889"}]'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @json = Event.find(params[:id]).to_gmaps4rails
  end

  # POST /events
  # POST /events.json
  def create

    @event = Event.new(params[:event])
    if @event.status_id.nil?
      @event.status_id = 10020
    end

    @event.description = @event.description.upcase
    @event.address = @event.address.upcase
    @event.suburb = @event.suburb.upcase
    @event.observations = @event.observations.upcase

    #    @event.searchable = @event.searchable+ " " + @event.idstring
    if @event.searchable==nil
      @event.searchable = " "
    end
    if @event.analyst_id != nil
      @event.searchable = @event.searchable + " " + @event.analyst.analyst
    end
    if @event.description != nil
      @event.searchable = @event.searchable+ " "+@event.description
    end
    if !@event.address.nil?
      @event.searchable=@event.searchable+" "+@event.address
    end
    if @event.locality_id!=nil
      @event.searchable=@event.searchable+" "+@event.locality.locality
    end
    if @event.area_id!=nil
      @event.searchable=@event.searchable+" "+@event.area.description
    end
    if @event.crime_id!=nil
      @event.searchable=@event.searchable+" "+@event.crime.crime
    end

    if @event.observations!=nil
      @event.searchable=@event.searchable+" "+@event.observations
    end
    respond_to do |format|
      if @event.save
        UserMailer.event_registration(@event).deliver
        format.html { redirect_to @event, notice: 'Evento registrado exitosamente.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    if @event.searchable==nil
      @event.searchable = " "
    end
    if @event.analyst_id != nil
      @event.searchable = @event.searchable + " " + @event.analyst.analyst
    end
    #    @event.searchable = @event.searchable+ " " + @event.idstring
    if @event.description != nil
      @event.searchable = @event.searchable+" "+@event.description
    end
    if @event.address!=nil
      @event.searchable=@event.searchable+" "+@event.address
    end
    if @event.locality_id!=nil
      @event.searchable=@event.searchable+" "+@event.locality.locality
    end
    if @event.area_id!=nil
      @event.searchable=@event.searchable+" "+@event.area.description
    end
    if @event.crime_id!=nil
      @event.searchable=@event.searchable+" "+@event.crime.crime
    end

    if @event.observations!=nil
      @event.searchable=@event.searchable+" "+@event.observations
    end
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Evento actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end


end
