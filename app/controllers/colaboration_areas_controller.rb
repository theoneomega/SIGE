class ColaborationAreasController < ApplicationController
  # GET /colaboration_areas
  # GET /colaboration_areas.json
  def index
    @colaboration_areas = ColaborationArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colaboration_areas }
    end
  end

  # GET /colaboration_areas/1
  # GET /colaboration_areas/1.json
  def show
    @colaboration_area = ColaborationArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @colaboration_area }
    end
  end

  # GET /colaboration_areas/new
  # GET /colaboration_areas/new.json
  def new
    @colaboration_area = ColaborationArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @colaboration_area }
    end
  end

  # GET /colaboration_areas/1/edit
  def edit
    @colaboration_area = ColaborationArea.find(params[:id])
  end

  # POST /colaboration_areas
  # POST /colaboration_areas.json
  def create
    @colaboration_area = ColaborationArea.new(params[:colaboration_area])

    respond_to do |format|
      if @colaboration_area.save
        format.html { redirect_to @colaboration_area, notice: 'Colaboration area was successfully created.' }
        format.json { render json: @colaboration_area, status: :created, location: @colaboration_area }
      else
        format.html { render action: "new" }
        format.json { render json: @colaboration_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colaboration_areas/1
  # PUT /colaboration_areas/1.json
  def update
    @colaboration_area = ColaborationArea.find(params[:id])

    respond_to do |format|
      if @colaboration_area.update_attributes(params[:colaboration_area])
        format.html { redirect_to @colaboration_area, notice: 'Colaboration area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @colaboration_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboration_areas/1
  # DELETE /colaboration_areas/1.json
  def destroy
    @colaboration_area = ColaborationArea.find(params[:id])
    @colaboration_area.destroy

    respond_to do |format|
      format.html { redirect_to colaboration_areas_url }
      format.json { head :no_content }
    end
  end
end
