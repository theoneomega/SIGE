class AnalystsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /analysts
  # GET /analysts.json
  def index
    @analysts = Analyst.order('id ASC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analysts }
    end
  end

  # GET /analysts/1
  # GET /analysts/1.json
  def show
    @analyst = Analyst.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @analyst }
    end
  end

  # GET /analysts/new
  # GET /analysts/new.json
  def new
    @analyst = Analyst.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analyst }
    end
  end

  # GET /analysts/1/edit
  def edit
    @analyst = Analyst.find(params[:id])
  end

  # POST /analysts
  # POST /analysts.json
  def create
    @analyst = Analyst.new(params[:analyst])

    respond_to do |format|
      if @analyst.save
        format.html { redirect_to @analyst, notice: 'Analyst was successfully created.' }
        format.json { render json: @analyst, status: :created, location: @analyst }
      else
        format.html { render action: "new" }
        format.json { render json: @analyst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analysts/1
  # PUT /analysts/1.json
  def update
    @analyst = Analyst.find(params[:id])

    respond_to do |format|
      if @analyst.update_attributes(params[:analyst])
        format.html { redirect_to analysts_path, notice: 'Analyst was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @analyst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysts/1
  # DELETE /analysts/1.json
  def destroy
    @analyst = Analyst.find(params[:id])
    @analyst.destroy

    respond_to do |format|
      format.html { redirect_to analysts_url }
      format.json { head :no_content }
    end
  end
end
