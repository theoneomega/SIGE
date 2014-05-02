class OfficesAttachmentsController < ApplicationController
  # GET /offices_attachments
  # GET /offices_attachments.json
  def index
    @offices_attachments = OfficesAttachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offices_attachments.map{ |upload| upload.to_jq_upload } }
    end
  end

  # GET /offices_attachments/1
  # GET /offices_attachments/1.json
  def show
    @offices_attachment = OfficesAttachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offices_attachment }
    end
  end

  # GET /offices_attachments/new
  # GET /offices_attachments/new.json
  def new
    @offices_attachment = OfficesAttachment.new
  end

  # GET /offices_attachments/1/edit
  def edit
    @offices_attachment = OfficesAttachment.find(params[:id])
  end

  # POST /offices_attachments
  # POST /offices_attachments.json
  def create
    @offices_attachment = OfficesAttachment.new(params[:offices_attachment])

    respond_to do |format|
      if @offices_attachment.save
        format.html { 
          render :json => [@offices_attachment.to_jq_upload].to_json, 
          :content_type => "text/html",
          :layout => false
        }
        format.json { render json:{files: [@offices_attachment.to_jq_upload]}, status: :created, location: @offices_attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @offices_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offices_attachments/1
  # PUT /offices_attachments/1.json
  def update
    @offices_attachment = OfficesAttachment.find(params[:id])

    respond_to do |format|
      if @offices_attachment.update_attributes(params[:offices_attachment])
        format.html { redirect_to @offices_attachment, notice: 'Offices attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offices_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices_attachments/1
  # DELETE /offices_attachments/1.json
  def destroy
    @offices_attachment = OfficesAttachment.find(params[:id])
    @offices_attachment.destroy

    respond_to do |format|
      format.html { redirect_to offices_attachments_url }
      format.json { head :no_content }
    end
  end
end
