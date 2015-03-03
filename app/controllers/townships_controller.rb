class TownshipsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /townships
  # GET /townships.json
  def index
    @townships = Township.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @townships }
    end
  end

  # GET /townships/1
  # GET /townships/1.json
  def show
    @township = Township.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @township }
    end
  end

  # GET /townships/new
  # GET /townships/new.json
  def new
    @township = Township.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @township }
    end
  end

  # GET /townships/1/edit
  def edit
    @township = Township.find(params[:id])
  end

  # POST /townships
  # POST /townships.json
  def create
    @township = Township.new(params[:township])

    respond_to do |format|
      if @township.save
        format.html { redirect_to @township, notice: 'Township was successfully created.' }
        format.json { render json: @township, status: :created, location: @township }
      else
        format.html { render action: "new" }
        format.json { render json: @township.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /townships/1
  # PUT /townships/1.json
  def update
    @township = Township.find(params[:id])

    respond_to do |format|
      if @township.update_attributes(params[:township])
        format.html { redirect_to @township, notice: 'Township was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @township.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /townships/1
  # DELETE /townships/1.json
  def destroy
    @township = Township.find(params[:id])
    @township.destroy

    respond_to do |format|
      format.html { redirect_to townships_url }
      format.json { head :no_content }
    end
  end
end
