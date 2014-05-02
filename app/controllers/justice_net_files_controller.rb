class JusticeNetFilesController < ApplicationController
  # GET /justice_net_files
  # GET /justice_net_files.json
  def index
    @justice_net_files = JusticeNetFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @justice_net_files }
    end
  end

  # GET /justice_net_files/1
  # GET /justice_net_files/1.json
  def show
    @justice_net_file = JusticeNetFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @justice_net_file }
    end
  end

  # GET /justice_net_files/new
  # GET /justice_net_files/new.json
  def new
    @justice_net_file = JusticeNetFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @justice_net_file }
    end
  end

  # GET /justice_net_files/1/edit
  def edit
    @justice_net_file = JusticeNetFile.find(params[:id])
  end

  # POST /justice_net_files
  # POST /justice_net_files.json
  def create
    @justice_net_file = JusticeNetFile.new(params[:justice_net_file])

    respond_to do |format|
      if @justice_net_file.save
        format.html { redirect_to @justice_net_file, notice: 'Justice net file was successfully created.' }
        format.json { render json: @justice_net_file, status: :created, location: @justice_net_file }
      else
        format.html { render action: "new" }
        format.json { render json: @justice_net_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /justice_net_files/1
  # PUT /justice_net_files/1.json
  def update
    @justice_net_file = JusticeNetFile.find(params[:id])

    respond_to do |format|
      if @justice_net_file.update_attributes(params[:justice_net_file])
        format.html { redirect_to @justice_net_file, notice: 'Justice net file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @justice_net_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /justice_net_files/1
  # DELETE /justice_net_files/1.json
  def destroy
    @justice_net_file = JusticeNetFile.find(params[:id])
    @justice_net_file.destroy

    respond_to do |format|
      format.html { redirect_to justice_net_files_url }
      format.json { head :no_content }
    end
  end
end
