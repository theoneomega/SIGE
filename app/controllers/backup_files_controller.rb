class BackupFilesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /backup_files
  # GET /backup_files.json
  def index
    @backup_files = BackupFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @backup_files }
    end
  end

  # GET /backup_files/1
  # GET /backup_files/1.json
  def show
    @backup_file = BackupFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @backup_file }
    end
  end

  # GET /backup_files/new
  # GET /backup_files/new.json
  def new
    @backup_file = BackupFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @backup_file }
    end
  end

  # GET /backup_files/1/edit
  def edit
    @backup_file = BackupFile.find(params[:id])
  end

  # POST /backup_files
  # POST /backup_files.json
  def create
    @backup_file = BackupFile.new(params[:backup_file])

    respond_to do |format|
      if @backup_file.save
        format.html { redirect_to @backup_file, notice: 'Backup file was successfully created.' }
        format.json { render json: @backup_file, status: :created, location: @backup_file }
      else
        format.html { render action: "new" }
        format.json { render json: @backup_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /backup_files/1
  # PUT /backup_files/1.json
  def update
    @backup_file = BackupFile.find(params[:id])

    respond_to do |format|
      if @backup_file.update_attributes(params[:backup_file])
        format.html { redirect_to @backup_file, notice: 'Backup file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @backup_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backup_files/1
  # DELETE /backup_files/1.json
  def destroy
    @backup_file = BackupFile.find(params[:id])
    @backup_file.destroy

    respond_to do |format|
      format.html { redirect_to backup_files_url }
      format.json { head :no_content }
    end
  end
end
