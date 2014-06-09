class WeaponTypesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def after_initialize
  rescue ActiveRecord::MissingAttributeError
    # this should only happen on Model.exists?() call. It can be safely ignored.
  end
  # GET /weapon_types
  # GET /weapon_types.json
  def index
    @weapon_types = WeaponType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weapon_types }
    end
  end

  # GET /weapon_types/1
  # GET /weapon_types/1.json
  def show
    @weapon_type = WeaponType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weapon_type }
    end
  end

  # GET /weapon_types/new
  # GET /weapon_types/new.json
  def new
    @weapon_type = WeaponType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weapon_type }
    end
  end

  # GET /weapon_types/1/edit
  def edit
    @weapon_type = WeaponType.find(params[:id])
  end

  # POST /weapon_types
  # POST /weapon_types.json
  def create
    @weapon_type = WeaponType.new(params[:weapon_type])

    respond_to do |format|
      if @weapon_type.save
        format.html { redirect_to @weapon_type, notice: 'Weapon type was successfully created.' }
        format.json { render json: @weapon_type, status: :created, location: @weapon_type }
      else
        format.html { render action: "new" }
        format.json { render json: @weapon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weapon_types/1
  # PUT /weapon_types/1.json
  def update
    @weapon_type = WeaponType.find(params[:id])

    respond_to do |format|
      if @weapon_type.update_attributes(params[:weapon_type])
        format.html { redirect_to @weapon_type, notice: 'Weapon type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weapon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapon_types/1
  # DELETE /weapon_types/1.json
  def destroy
    @weapon_type = WeaponType.find(params[:id])
    @weapon_type.destroy

    respond_to do |format|
      format.html { redirect_to weapon_types_url }
      format.json { head :no_content }
    end
  end
end
