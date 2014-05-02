class IphsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /iphs
  # GET /iphs.json
  def index
    @iphs = Iph.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iphs }
    end
  end

  # GET /iphs/1
  # GET /iphs/1.json
  def show
    @iph = Iph.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph }
    end
  end

  # GET /iphs/new
  # GET /iphs/new.json
  def new
    @iph = Iph.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph }
    end
  end

  # GET /iphs/1/edit
  def edit
    @iph = Iph.find(params[:id])
    @iph.user_id = current_user.id
  end

  # POST /iphs
  # POST /iphs.json
  def create
    @iph = Iph.new(params[:iph])
    @iph.user_id = current_user.id

    respond_to do |format|
      if @iph.save
        format.html { redirect_to @iph, notice: 'IPH Creado correctamente.' }
        format.json { render json: @iph, status: :created, location: @iph }
      else
        format.html { render action: "new" }
        format.json { render json: @iph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iphs/1
  # PUT /iphs/1.json
  def update
    @iph = Iph.find(params[:id])
    @iph.user_id = current_user.id

    respond_to do |format|
      if @iph.update_attributes(params[:iph])
        format.html { redirect_to @iph, notice: 'IPH Actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iphs/1
  # DELETE /iphs/1.json
  def destroy
    @iph = Iph.find(params[:id])
    @iph.destroy

    respond_to do |format|
      format.html { redirect_to iphs_url }
      format.json { head :no_content }
    end
  end
end
