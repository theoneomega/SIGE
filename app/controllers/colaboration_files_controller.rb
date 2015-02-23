class ColaborationFilesController < ApplicationController
  # GET /colaboration_files
  # GET /colaboration_files.json
  def index
    @colaboration_files = ColaborationFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colaboration_files }
    end
  end

  # GET /colaboration_files/1
  # GET /colaboration_files/1.json
  def show
    @colaboration_file = ColaborationFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @colaboration_file }
    end
  end

  # GET /colaboration_files/new
  # GET /colaboration_files/new.json
  def new
    @colaboration_file = ColaborationFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @colaboration_file }
    end
  end

  # GET /colaboration_files/1/edit
  def edit
    @colaboration_file = ColaborationFile.find(params[:id])
  end

  # POST /colaboration_files
  # POST /colaboration_files.json
  def create
    @colaboration_file = ColaborationFile.new(params[:colaboration_file])

    respond_to do |format|
      if @colaboration_file.save
        format.html { redirect_to @colaboration_file, notice: 'Colaboration file was successfully created.' }
        format.json { render json: @colaboration_file, status: :created, location: @colaboration_file }
      else
        format.html { render action: "new" }
        format.json { render json: @colaboration_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colaboration_files/1
  # PUT /colaboration_files/1.json
  def update
    @colaboration_file = ColaborationFile.find(params[:id])

    respond_to do |format|
      if @colaboration_file.update_attributes(params[:colaboration_file])
        format.html { redirect_to @colaboration_file, notice: 'Colaboration file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @colaboration_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboration_files/1
  # DELETE /colaboration_files/1.json
  def destroy
    @colaboration_file = ColaborationFile.find(params[:id])
    @colaboration_file.destroy

    respond_to do |format|
      format.html { redirect_to colaboration_files_url }
      format.json { head :no_content }
    end
  end
end
