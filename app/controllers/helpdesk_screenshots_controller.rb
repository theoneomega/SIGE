class HelpdeskScreenshotsController < ApplicationController
  # before_filter :authenticate_user!
  # load_and_authorize_resource

  def index
    @helpdesk = Helpdesk.find(params[:helpdesk_id])
    @helpdesk_screenshots = @helpdesk.helpdesk_screenshots

    respond_to do |format|
      format.html # index.html.erb
      format.html
      format.json { render json: @helpdesk_screenshots}
      # format.json { render json: @helpdesk_screenshots }
      # format.json { render json: @helpdesk_screenshots.map{ |helpdesk_screenshot| helpdesk_screenshot.to_jq_upload } }
    end
  end


  def show
    @helpdesk_screenshot = HelpdeskScreenshot.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @helpdesk_screenshot }
    end
  end


  def new
    @helpdesk = Helpdesk.find(params[:helpddesk_id]) #agregado del otro ejemplo
    @helpdesk_screenshot =  @helpdesk.helpdesk_screenshots.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @helpdesk_screenshot }
    end
  end


  def edit
    @helpdesk = Helpdesk.find(params[:helpdesk_screenshot_id])

    @helpdesk_screenshot = @helpdesk.helpdesk_screenshots.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  def create
    p_attr = params[:helpdesk_screenshot]
    p_attr[:screenshot] = params[:helpdesk_screenshot][:screenshot].first if params[:helpdesk_screenshot][:screenshot].class == Array
    if params[:helpdesk_id]
      @helpdesk = Helpdesk.find(params[:helpdesk_id])
      @helpdesk_screenshot = @helpdesk.helpdesk_screenshots.build(p_attr)
    else
      @helpdesk_screenshot = HelpdeskScreenshot.new(p_attr)
    end

    if @helpdesk_screenshot.save
      respond_to do |format|
        format.html {
          render :json => [@helpdesk_screenshot.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json{
          render :json => [@helpdesk_screenshot.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom failure"}], :status => 304
    end


    # @helpdesk_screenshot = HelpdeskScreenshot.new(params[:helpdesk_screenshot])
    # @helpdesk_screenshot.visible = true

    # respond_to do |format|
    #   if @helpdesk_screenshot.save
    #     format.html {
    #       render :json => [@helpdesk_screenshot.to_jq_upload].to_json,
    #              :content_type => "text/html",
    #              :layout => false
    #     }
    #     format.json { render json:{files: [@helpdesk_screenshot.to_jq_upload]}, status: :created, location: @helpdesk_screenshot }
    # else
    #   format.html { render action: "new" }
    #   format.json { render json: @helpdesk_screenshot.errors, status: :unprocessable_entity }
    # end

  end

  def update
    @helpdesk = Helpdesk.find(params[:helpdesk_id])
    @helpdesk_screenshot = @helpdesk.helpdesk_screenshots.find(params[:id])

    respond_to do |format|
      if @helpdesk_screenshot.update_attributes(params[:helpdesk_screenshot])
        format.html { redirect_to @helpdesk_screenshot, notice: 'Helpdesk screenshot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @helpdesk_screenshot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @helpdesk = Helpdesk.find(params[:helpdesk_id])
    @helpdesk_screenshot = @helpdesk.helpdesk_screenshots.find(params[:id])
    # @helpdesk_screenshot = HelpdeskScreenshot.find(params[:id])
    @helpdesk_screenshot.visible = false
    @helpdesk_screenshot.save

    respond_to do |format|
      format.html { redirect_to helpdesk_screenshots_url }
      format.json { head :no_content }
    end
  end
end
