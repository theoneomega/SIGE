class IphDrugsController < ApplicationController
  # GET /iph_drugs
  # GET /iph_drugs.json
  def index
    @iph_drugs = IphDrug.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iph_drugs }
    end
  end

  # GET /iph_drugs/1
  # GET /iph_drugs/1.json
  def show
    @iph_drug = IphDrug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph_drug }
    end
  end

  # GET /iph_drugs/new
  # GET /iph_drugs/new.json
  def new
    @iph_drug = IphDrug.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph_drug }
    end
  end

  # GET /iph_drugs/1/edit
  def edit
    @iph_drug = IphDrug.find(params[:id])
  end

  # POST /iph_drugs
  # POST /iph_drugs.json
  def create
    @iph_drug = IphDrug.new(params[:iph_drug])

    respond_to do |format|
      if @iph_drug.save
        format.html { redirect_to @iph_drug, notice: 'Iph drug was successfully created.' }
        format.json { render json: @iph_drug, status: :created, location: @iph_drug }
      else
        format.html { render action: "new" }
        format.json { render json: @iph_drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iph_drugs/1
  # PUT /iph_drugs/1.json
  def update
    @iph_drug = IphDrug.find(params[:id])

    respond_to do |format|
      if @iph_drug.update_attributes(params[:iph_drug])
        format.html { redirect_to @iph_drug, notice: 'Iph drug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph_drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iph_drugs/1
  # DELETE /iph_drugs/1.json
  def destroy
    @iph_drug = IphDrug.find(params[:id])
    @iph_drug.destroy

    respond_to do |format|
      format.html { redirect_to iph_drugs_url }
      format.json { head :no_content }
    end
  end
end
