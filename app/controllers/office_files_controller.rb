class OfficeFilesController < ApplicationController
  def index
    @office_files = OfficeFile.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @office_files.map{|file| file.to_jq_upload} }
    end
  end

  def show
    @office_file = OfficeFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @office_file}
    end
  end

  def new
    @office_file = OfficeFile.new
    
    respond_to do |format|
      format.html
      format.json {render json: @office_file}
    end
  end
  
  def edit
    @office_file = OfficeFile.find(params[:id])
  end
  
  def create
    @office_file = OfficeFile.new(params[:office_file])
    p" estos son los parametros: #{params[:office_file]}"
    respond_to do |format|
      if @office_file.save
        format.html {
          render :json => [@office_file.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json:{files: [@office_file.to_jq_upload]}, status: :created, location: @office_file }
      else
        format.html { render action: "new" }
        format.json { render json: @office_file.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @office_file = OfficeFile.find(params[:id])
    
    respond_to do |format|
      if @office_file.update_attributes(params[:office_file])
        format.html { redirect_to @office_file, notice: "actualizado"}
        format.json { head :no_content}
      else
        format.html { render action: "edit" }
        format.json { render json: @office_file.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @office_file = OfficeFile.find(params[:id])
    @office_file.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

end
