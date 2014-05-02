class CriminalGroupsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /criminal_groups
  # GET /criminal_groups.json
  def index
    @criminal_groups = CriminalGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @criminal_groups }
    end
  end

  # GET /criminal_groups/1
  # GET /criminal_groups/1.json
  def show
    @criminal_group = CriminalGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @criminal_group }
    end
  end

  # GET /criminal_groups/new
  # GET /criminal_groups/new.json
  def new
    @criminal_group = CriminalGroup.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @criminal_group }
    end
  end

  # GET /criminal_groups/1/edit
  def edit
    @criminal_group = CriminalGroup.find(params[:id])
  end

  # POST /criminal_groups
  # POST /criminal_groups.json
  def create
    @criminal_group = CriminalGroup.new(params[:criminal_group])

    respond_to do |format|
      if @criminal_group.save
        format.html { redirect_to @criminal_group, notice: 'Criminal group was successfully created.' }
        format.json { render json: @criminal_group, status: :created, location: @criminal_group }
      else
        format.html { render action: "new" }
        format.json { render json: @criminal_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /criminal_groups/1
  # PUT /criminal_groups/1.json
  def update
    @criminal_group = CriminalGroup.find(params[:id])

    respond_to do |format|
      if @criminal_group.update_attributes(params[:criminal_group])
        format.html { redirect_to @criminal_group, notice: 'Criminal group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @criminal_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criminal_groups/1
  # DELETE /criminal_groups/1.json
  def destroy
    @criminal_group = CriminalGroup.find(params[:id])
    @criminal_group.destroy

    respond_to do |format|
      format.html { redirect_to criminal_groups_url }
      format.json { head :no_content }
    end
  end
end
