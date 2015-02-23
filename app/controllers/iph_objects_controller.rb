class IphObjectsController < ApplicationController
  # GET /iph_objects
  # GET /iph_objects.json
  def index
    @iph_objects = IphObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iph_objects }
    end
  end

  # GET /iph_objects/1
  # GET /iph_objects/1.json
  def show
    @iph_object = IphObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph_object }
    end
  end

  # GET /iph_objects/new
  # GET /iph_objects/new.json
  def new
    @iph_object = IphObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph_object }
    end
  end

  # GET /iph_objects/1/edit
  def edit
    @iph_object = IphObject.find(params[:id])
  end

  # POST /iph_objects
  # POST /iph_objects.json
  def create
    @iph_object = IphObject.new(params[:iph_object])

    respond_to do |format|
      if @iph_object.save
        format.html { redirect_to @iph_object, notice: 'Iph object was successfully created.' }
        format.json { render json: @iph_object, status: :created, location: @iph_object }
      else
        format.html { render action: "new" }
        format.json { render json: @iph_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iph_objects/1
  # PUT /iph_objects/1.json
  def update
    @iph_object = IphObject.find(params[:id])

    respond_to do |format|
      if @iph_object.update_attributes(params[:iph_object])
        format.html { redirect_to @iph_object, notice: 'Iph object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iph_objects/1
  # DELETE /iph_objects/1.json
  def destroy
    @iph_object = IphObject.find(params[:id])
    @iph_object.destroy

    respond_to do |format|
      format.html { redirect_to iph_objects_url }
      format.json { head :no_content }
    end
  end
end
