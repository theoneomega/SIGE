class IphVehiclesController < ApplicationController
  # GET /iph_vehicles
  # GET /iph_vehicles.json
  def index
    @iph_vehicles = IphVehicle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iph_vehicles }
    end
  end

  # GET /iph_vehicles/1
  # GET /iph_vehicles/1.json
  def show
    @iph_vehicle = IphVehicle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph_vehicle }
    end
  end

  # GET /iph_vehicles/new
  # GET /iph_vehicles/new.json
  def new
    @iph_vehicle = IphVehicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph_vehicle }
    end
  end

  # GET /iph_vehicles/1/edit
  def edit
    @iph_vehicle = IphVehicle.find(params[:id])
  end

  # POST /iph_vehicles
  # POST /iph_vehicles.json
  def create
    @iph_vehicle = IphVehicle.new(params[:iph_vehicle])

    respond_to do |format|
      if @iph_vehicle.save
        format.html { redirect_to @iph_vehicle, notice: 'Iph vehicle was successfully created.' }
        format.json { render json: @iph_vehicle, status: :created, location: @iph_vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @iph_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iph_vehicles/1
  # PUT /iph_vehicles/1.json
  def update
    @iph_vehicle = IphVehicle.find(params[:id])

    respond_to do |format|
      if @iph_vehicle.update_attributes(params[:iph_vehicle])
        format.html { redirect_to @iph_vehicle, notice: 'Iph vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iph_vehicles/1
  # DELETE /iph_vehicles/1.json
  def destroy
    @iph_vehicle = IphVehicle.find(params[:id])
    @iph_vehicle.destroy

    respond_to do |format|
      format.html { redirect_to iph_vehicles_url }
      format.json { head :no_content }
    end
  end
end
