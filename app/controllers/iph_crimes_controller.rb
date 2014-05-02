class IphCrimesController < ApplicationController
  # GET /iph_crimes
  # GET /iph_crimes.json
  def index
    @iph_crimes = IphCrime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iph_crimes }
    end
  end

  # GET /iph_crimes/1
  # GET /iph_crimes/1.json
  def show
    @iph_crime = IphCrime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph_crime }
    end
  end

  # GET /iph_crimes/new
  # GET /iph_crimes/new.json
  def new
    @iph_crime = IphCrime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph_crime }
    end
  end

  # GET /iph_crimes/1/edit
  def edit
    @iph_crime = IphCrime.find(params[:id])
  end

  # POST /iph_crimes
  # POST /iph_crimes.json
  def create
    @iph_crime = IphCrime.new(params[:iph_crime])

    respond_to do |format|
      if @iph_crime.save
        format.html { redirect_to @iph_crime, notice: 'Iph crime was successfully created.' }
        format.json { render json: @iph_crime, status: :created, location: @iph_crime }
      else
        format.html { render action: "new" }
        format.json { render json: @iph_crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iph_crimes/1
  # PUT /iph_crimes/1.json
  def update
    @iph_crime = IphCrime.find(params[:id])

    respond_to do |format|
      if @iph_crime.update_attributes(params[:iph_crime])
        format.html { redirect_to @iph_crime, notice: 'Iph crime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph_crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iph_crimes/1
  # DELETE /iph_crimes/1.json
  def destroy
    @iph_crime = IphCrime.find(params[:id])
    @iph_crime.destroy

    respond_to do |format|
      format.html { redirect_to iph_crimes_url }
      format.json { head :no_content }
    end
  end
end
