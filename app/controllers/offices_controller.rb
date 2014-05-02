class OfficesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /offices
  # GET /offices.json
  def index
    #    flash[:notice]= current_user.analyst.area_id
    if current_user.role.super_admin==true|| current_user.role.ie_supervisor==true || current_user.role.super_supervisor==true 
      @offices = Office.where('status_id BETWEEN ? AND ? or status_id = ? or status_id = ?', 10003,10005, 10007, 10061).order('received_date DESC')
      #      @events = Event.find(:all, :conditions => ["status_id BETWEEN ? AND ? ", 10020,10022]).order('priority_id ASC')
    elsif current_user.role.analyst == true and current_user.role.iph_supervisor == true
      status = Status.find_by_description_and_status_type("ASIGNADO", "Colaboracion").id
      if current_user.analyst.area.description == "OCCIDENTE"
        @offices = Office.where("analyst_id = ? AND status_id = ? AND area_id = ?", current_user.analyst_id, status, current_user.analyst.area_id).order('received_date DESC')
      elsif current_user.analyst.area.description == "SUR"
        @offices = Office.where("analyst_id = ? AND status_id = ? AND area_id = ?", current_user.analyst_id, status, current_user.analyst.area_id).order('received_date DESC')
      end
      
    elsif  current_user.role.supervisor
      norte = Area.find_by_description("NORTE").id
      centro = Area.find_by_description("CENTRO").id
      sur = Area.find_by_description("SUR").id
      occidente = Area.find_by_description("OCCIDENTE").id
      if current_user.analyst.area_id == norte
        flash[:notice]= "oficios norte"
        @offices = Office.where('status_id BETWEEN ? AND ?  AND area_id = ? ', 10003,10005, norte).order('received_date DESC')
      elsif current_user.analyst.area_id == centro
        @offices = Office.where('status_id BETWEEN ? AND ? AND area_id BETWEEN ? AND ?', 10003,10005,10001, 10003).order('received_date DESC')
      elsif current_user.analyst.area_id == 10002
        @offices = Office.where('status_id BETWEEN ? AND ? AND area_id = ?', 10003,10005, 10002).order('received_date DESC')
      end
    elsif  current_user.role.administrator == true
      if current_user.analyst.area_id == 10000
        @offices = Office.where('status_id != ? AND area_id = ?', 10006, 10000).order('received_date DESC')
      elsif current_user.analyst.area_id != 10000
        @offices = Office.where('status_id BETWEEN ? AND ? or status_id = ? or status_id = ?', 10003,10005, 10007, 10061).order('received_date DESC')
      end
    else
      @offices = Office.where("analyst_id = ? AND status_id = ?", current_user.analyst_id, 10005).order('received_date DESC')
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offices }
    end
  end

  
  def not_assigned
    zona = current_user.analyst.area_id 
    recibido = Status.find_by_description_and_status_type("RECIBIDO", "Colaboracion").id
    terminado = Status.find_by_description_and_status_type("ENVIADO", "Colaboracion").id
    area = Area.find_by_description("NORTE").id
    
    if current_user.role.supervisor or current_user.role.administrator
        if current_user.analyst.area.description == 'CENTRO' 
         @offices = Office.where("status_id = ? AND area_id != ?", recibido ,area).order('received_date DESC')
        else
          @offices = Office.where("status_id = ? AND area_id = ?", recibido, area).order('received_date DESC')
        end
    elsif current_user.role.super_admin
      @offices = Office.where("analyst_id is NULL AND status_id != ?",terminado).order('received_date DESC')
    end
    respond_to do |format|
      format.html
    end
  end
  
  def working
    #    flash[:error] = "im on working"
    zona = current_user.analyst.area_id 
    asignado = Status.find_by_description_and_status_type("ASIGNADO", "Colaboracion").id
    if current_user.role.administrator or current_user.role.supervisor
      if current_user.analyst.area.description == 'CENTRO' 
        @offices = Office.where("status_id = ? ",asignado ).order('received_date DESC')
      else
        @offices = Office.where("status_id = ? AND area_id = ?",asignado, zona ).order('received_date DESC')
      end
    elsif current_user.role.supervisor
      if current_user.analyst.area.description == 'CENTRO' 
        @offices = Office.where("status_id = ? ANd area_id = ? ",asignado, zona ).order('received_date DESC')
      else
        @offices = Office.where("status_id = ? AND area_id = ?",asignado, zona ).order('received_date DESC')
      end
    elsif current_user.role.super_admin or current_user.role.ie_supervisor || current_user.role.super_supervisor
      @offices = Office.where("status_id = ? ",asignado ).order('received_date DESC')
    end
  end
  
  def standby
    zona = current_user.analyst.area_id 
    terminado = Status.find_by_description_and_status_type("TERMINADO", "Colaboracion").id
    if current_user.role.administrator or current_user.role.iph_supervisor 
      if current_user.analyst.area.description == 'CENTRO' 
        @offices = Office.where("status_id = ? ",terminado ).order('received_date DESC')
      else
        @offices = Office.where("status_id = ? AND area_id = ?",terminado, zona ).order('received_date DESC')
      end
    elsif current_user.role.supervisor
      if current_user.analyst.area.description == 'CENTRO' 
        @offices = Office.where("status_id = ? ANd area_id = ? ",terminado, zona ).order('received_date DESC')
      else
        @offices = Office.where("status_id = ? AND area_id = ?",terminado, zona ).order('received_date DESC')
      end
    elsif current_user.role.super_admin or current_user.role.ie_supervisor || current_user.role.super_supervisor
      @offices = Office.where("status_id = ? ",terminado ).order('received_date DESC')
    end
  end
  
  
  def waiting
    zona = current_user.analyst.area_id 
    aprobado = Status.find_by_description_and_status_type("APROBADO", "Colaboracion").id
    if current_user.role.administrator or current_user.role.iph_supervisor
      if current_user.analyst.area.description == 'CENTRO' 
        @offices = Office.where("status_id = ? ",aprobado ).order('received_date DESC')
      else
        @offices = Office.where("status_id = ? AND area_id = ?",aprobado, zona ).order('received_date DESC')
      end
    elsif current_user.role.super_admin or current_user.role.ie_supervisor || current_user.role.super_supervisor
      @offices = Office.where("status_id = ? ",aprobado ).order('received_date DESC')
    end
  end
  
  def replied
    zona = current_user.analyst.area_id 
    contestado = Status.find_by_description_and_status_type("CONTESTADO", "Colaboracion").id
    if current_user.role.administrator or current_user.role.iph_supervisor
      if current_user.analyst.area.description == 'CENTRO' 
        @offices = Office.where("status_id = ? ",contestado ).order('received_date DESC')
      else
        @offices = Office.where("status_id = ? AND area_id = ?",contestado, zona ).order('received_date DESC')
      end
    elsif current_user.role.super_admin or current_user.role.ie_supervisor || current_user.role.super_supervisor
      @offices = Office.where("status_id = ? ",contestado ).order('received_date DESC')
    end
    
  end
  
  
  # GET /offices/1
  # GET /offices/1.json
  def show
    @office = Office.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @office }
    end
  end

  # GET /offices/new
  # GET /offices/new.json
  def new
    @office = Office.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @office }
    end
  end

  # GET /offices/1/edit
  def edit
    @office = Office.find(params[:id])
  end

  # POST /offices
  # POST /offices.json
  def create
    @office = Office.new(params[:office])
    
    respond_to do |format|
      if @office.save
        format.html { redirect_to @office, notice: 'Oficio registrado con exito.' }
        format.json { render json: @office, status: :created, location: @office }
      else
        format.html { render action: "new" }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def approve
    @office = Office.find(params[:id])
    @office.status_id = 10007
    if @office.update_attributes(params[:office])
      redirect_to offices_url,
        notice: 'Oficio aprovado con exito.'
    end
  end
  


  # PUT /offices/1
  # PUT /offices/1.json
  def update
    @office = Office.find(params[:id])
    @office.user_id=current_user.id
    respond_to do |format|
      if @office.update_attributes(params[:office])
        format.html { redirect_to @office, notice: 'Oficio actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
  
  def refuse_update
    @office = Office.find(params[:id])
    if @office.update_attributes(params[:office])
      notice 'Oficio rechazado.'
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @office = Office.find(params[:id])
    @office.destroy

    respond_to do |format|
      format.html { redirect_to offices_url }
      format.json { head :no_content }
    end
  end
end
