class HelpdesksController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    if current_user.role.analysts_supervisor || current_user.role.super_admin
      @helpdesks = Helpdesk.where(:active => true)
    elsif current_user.role.analyst
      @helpdesks = Helpdesk.where(:analyst_id => current_user.analyst_id, :active => true)
    else
      @helpdesks = []
    end



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @helpdesks }
    end
  end

  # GET /helpdesks/1
  # GET /helpdesks/1.json
  def show
    @helpdesk = Helpdesk.find(params[:id])
    @helpdesk_screenshot = @helpdesk.helpdesk_screenshots.build
    @helpdesk_screenshots = HelpdeskScreenshot.where(:helpdesk_id => @helpdesk.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @helpdesk }
    end
  end

  # GET /helpdesks/new
  # GET /helpdesks/new.json
  def new
    @helpdesk = Helpdesk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @helpdesk }
    end
  end

  # GET /helpdesks/1/edit
  def edit
    @helpdesk = Helpdesk.find(params[:id])
  end

  # POST /helpdesks
  # POST /helpdesks.json
  def create
    @helpdesk = Helpdesk.new(params[:helpdesk])

    respond_to do |format|
      if @helpdesk.save
        format.html { redirect_to @helpdesk, notice: 'Helpdesk was successfully created.' }
        format.json { render json: @helpdesk, status: :created, location: @helpdesk }
      else
        format.html { render action: "new" }
        format.json { render json: @helpdesk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /helpdesks/1
  # PUT /helpdesks/1.json
  def update
    @helpdesk = Helpdesk.find(params[:id])

    respond_to do |format|
      if @helpdesk.update_attributes(params[:helpdesk])
        format.html { redirect_to @helpdesk, notice: 'Helpdesk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @helpdesk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helpdesks/1
  # DELETE /helpdesks/1.json
  def destroy
    @helpdesk = Helpdesk.find(params[:id])
    @helpdesk.destroy

    respond_to do |format|
      format.html { redirect_to helpdesks_url }
      format.json { head :no_content }
    end
  end


end
