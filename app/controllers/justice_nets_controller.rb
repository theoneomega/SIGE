class JusticeNetsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /justice_nets
  # GET /justice_nets.json
  def index
    finalizado = Status.find_by_description_and_status_type("FINALIZADO","Justici@.NET").id
    norte = Area.find_by_description("NORTE").id
    if current_user.role.super_admin == true|| 
        current_user.role.ie_supervisor==true || 
        current_user.role.super_supervisor==true
        
      @justice_nets = JusticeNet.order('received_date DESC').paginate(:page => params[:page])
    elsif current_user.role.supervisor == true
      if current_user.analyst.area.description == "NORTE"
        @justice_nets = JusticeNet.where('area_id = ?',  norte).order('received_date DESC').paginate(:page => params[:page])
      else
        @justice_nets = JusticeNet.where('area_id != ?', norte).order('received_date DESC').paginate(:page => params[:page])
      end
    elsif current_user.role.analyst == true
      @justice_nets = JusticeNet.where('analyst_id = ?', current_user.analyst_id).order('received_date DESC').paginate(:page => params[:page])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @justice_nets }
    end
  end

  # GET /justice_nets/1
  # GET /justice_nets/1.json
  def show
    @justice_net = JusticeNet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @justice_net }
    end
  end

  # GET /justice_nets/new
  # GET /justice_nets/new.json
  def new
    @justice_net = JusticeNet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @justice_net }
    end
  end

  # GET /justice_nets/1/edit
  def edit
    @justice_net = JusticeNet.find(params[:id])
  end

  # POST /justice_nets
  # POST /justice_nets.json
  def create
    @justice_net = JusticeNet.new(params[:justice_net])

    respond_to do |format|
      if @justice_net.save
        format.html { redirect_to @justice_net, notice: 'Se ah registrado una peticion exitosamente.' }
        format.json { render json: @justice_net, status: :created, location: @justice_net }
      else
        format.html { render action: "new" }
        format.json { render json: @justice_net.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /justice_nets/1
  # PUT /justice_nets/1.json
  def update
    @justice_net = JusticeNet.find(params[:id])

    respond_to do |format|
      if @justice_net.update_attributes(params[:justice_net])
        format.html { redirect_to @justice_net, notice: 'Se ah actualizado una peticion exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @justice_net.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /justice_nets/1
  # DELETE /justice_nets/1.json
  def destroy
    @justice_net = JusticeNet.find(params[:id])
    @justice_net.destroy

    respond_to do |format|
      format.html { redirect_to justice_nets_url }
      format.json { head :no_content }
    end
  end
  
  def assign_net
    @justice_net = JusticeNet.find(params[:id])
    @justice_net.update_attributes(params[:justice_net])
    @justice_net.save
  end
  
  def approve_net
    @justice_net = JusticeNet.find(params[:id])
    estatus = Status.find_by_description_and_status_type("APROBADO","Justici@.NET").id
    @justice_net.status_id = estatus
    if @justice_net.update_attributes(params[:justice_net])
      redirect_to justice_nets_url,
        notice: 'Aprobado con exito.'
    end
  end
  
  def finish
   @justice_net = JusticeNet.find(params[:id])
   estatus = Status.find_by_description_and_status_type("FINALIZADO","Justici@.NET").id
   @justice_net.status_id = estatus
   if @justice_net.update_attributes(params[:justice_net])
      redirect_to justice_nets_url,
        notice: 'Finalizado con exito.'
    end
  end
  
end
