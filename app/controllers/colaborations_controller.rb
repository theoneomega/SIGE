class ColaborationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index



    if current_user.role.super_admin  || current_user.role.ie_supervisor  || current_user.role.super_supervisor
      @colaborations = Colaboration.where('status_id != ? AND dieid = ?', 10006, true).order('id ASC')
    elsif current_user.role.supervisor and current_user.analyst.area.description == "CENTRO"
      @colaborations = Colaboration .where('status_id BETWEEN ? AND ?  AND area_id != ?  AND dieid = ?',10003,10005, 10000, true).order('status_id ASC')
    elsif current_user.role.supervisor and current_user.analyst.area.description == "NORTE"
      @colaborations = Colaboration.where('status_id != ?  AND area_id = ?  AND dieid = ?',10006, 10000, true).order('status_id ASC')
    elsif current_user.role.analyst
      @colaborations = Colaboration.where("analyst_id = ? AND status_id = ?  AND dieid = ?", current_user.analyst_id, 10005, true).order('status_id ASC')
    end



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colaborations }
    end
  end

  # GET /colaborations/1
  # GET /colaborations/1.json
  def show
    @colaboration = Colaboration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @colaboration }
    end
  end

  # GET /colaborations/new
  # GET /colaborations/new.json
  def new
    @colaboration = Colaboration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @colaboration }
    end
  end

  # GET /colaborations/1/edit
  def edit
    @colaboration = Colaboration.find(params[:id])
    @colaboration.user_id=current_user.id
  end

  # POST /colaborations
  # POST /colaborations.json
  def create

    if current_user.analyst.department == "DIEID" or current_user.analyst.department == "INFORMACION ESTATAL"
      @colaboration.dieid = true
      @colaboration.cibernetica= false
    end
    if current_user.analyst.department == "CIBERNETICA"
      @colaboration.cibernetica = true
      @colaboration.dieid = false
    end

    @colaboration = Colaboration.new(params[:colaboration])
    @colaboration.requesting_area = @colaboration.requesting_area.upcase
    @colaboration.claimant = @colaboration.claimant.upcase
    @colaboration.replied_for = @colaboration.replied_for.upcase
    #    @colaboration.observations = @colaboration.observations.sub(pattern) { |match|  }
    @colaboration.observations = @colaboration.observations.upcase
    @colaboration.user_id=current_user.id

    if @colaboration.searchable==nil
      @colaboration.searchable = " "
    end

    if @colaboration.area_id!=nil
      @colaboration.searchable=@colaboration.searchable+" "+@colaboration.area.description
    end
    if @colaboration.analyst_id != nil
      @colaboration.searchable=@colaboration.searchable+" "+@colaboration.analyst.analyst
    end

    respond_to do |format|
      if @colaboration.save
        format.html { redirect_to @colaboration, notice: 'Colaboracion registrada exitosamente.' }
        format.json { render json: @colaboration, status: :created, location: @colaboration }
      else
        format.html { render action: "new" }
        format.json { render json: @colaboration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colaborations/1
  # PUT /colaborations/1.json
  def update
    @colaboration = Colaboration.find(params[:id])
    @colaboration.user_id=current_user.id

    respond_to do |format|
      if @colaboration.update_attributes(params[:colaboration])
        format.html { redirect_to @colaboration, notice: 'Colaboracion actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @colaboration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaborations/1
  # DELETE /colaborations/1.json
  def destroy
    @colaboration = Colaboration.find(params[:id])
    @colaboration.destroy

    respond_to do |format|
      format.html { redirect_to colaborations_url }
      format.json { head :no_content }
    end
  end

  def approve
    @colaboration = Colaboration.find(params[:id])
    @colaboration.status_id = 10007
    if @colaboration.update_attributes(params[:colaboration])
      redirect_to colaborations_path,
                  notice: 'Colabooracion aprobada con exito.'
    end
  end

  def sendit
    @colaboration = Colaboration.find(params[:id])
    @colaboration.status_id = 10006
    respond_to do |format|
      if @colaboration.update_attributes(params[:colaboration])
        format.html { redirect_to colaborations_path, notice: 'Colaboracion Enviada exitosamente.' }
      else
        format.html { redirect_to :back }
      end
    end
  end

end
