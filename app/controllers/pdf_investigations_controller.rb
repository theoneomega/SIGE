class PdfInvestigationsController < ApplicationController
  def index
    @and_investigations = PdfInvestigation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @and_investigations.map{ |pdf| pdf.to_jq_upload } }
    end
  end

  def new
    @pdf_investigation = PdfInvestigation.new
  end

  def create
    @pdf_investigation = PdfInvestigation.new(params[:pdf_investigation])
    @pdf_investigation.visible=true

    respond_to do |format|
      if @pdf_investigation.save
        format.html {
          render :json => [@pdf_investigation.to_jq_upload].to_json,
                 :content_type => "text/html",
                 :layout => false
        }
        format.json { render json:{files: [@pdf_investigation.to_jq_upload]}, status: :created, location: @pdf_investigation }
      else
        format.html { render action: "new" }
        format.json { render json: @pdf_investigation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pdf_investigation = PdfInvestigation.find(params[:id])
    @pdf_investigation.visible = false
    @pdf_investigation.save

    respond_to do |format|
      format.html { redirect_to offices_attachments_url }
      format.json { head :no_content }
    end
  end
end
