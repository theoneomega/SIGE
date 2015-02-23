class HelpdesksController < ApplicationController
  # GET /helpdesks
  # GET /helpdesks.json
  def index
    @helpdesks = Helpdesk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @helpdesks }
    end
  end

  # GET /helpdesks/1
  # GET /helpdesks/1.json
  def show
    @helpdesk = Helpdesk.find(params[:id])

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
