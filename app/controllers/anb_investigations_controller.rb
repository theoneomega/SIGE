class AnbInvestigationsController < ApplicationController
  def index
    @and_investigations = AnbInvestigation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @and_investigations.map{ |anb| anb.to_jq_upload } }
    end
  end

  def new
    @anb_investigation = AnbInvestigation.new
  end

  def create
    @anb_investigation = AnbInvestigation.new(params[:anb_investigation])
    @anb_investigation.visible =true
    respond_to do |format|
      if @anb_investigation.save
        format.html {
          render :json => [@anb_investigation.to_jq_upload].to_json,
                 :content_type => "text/html",
                 :layout => false
        }
        format.json { render json:{files: [@anb_investigation.to_jq_upload]}, status: :created, location: @anb_investigation }
      else
        format.html { render action: "new" }
        format.json { render json: @anb_investigation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @anb_investigation = AnbInvestigation.find(params[:id])
    @anb_investigation.visible = false
    @anb_investigation.save

    respond_to do |format|
      format.html { redirect_to offices_attachments_url }
      format.json { head :no_content }
    end
  end
end
