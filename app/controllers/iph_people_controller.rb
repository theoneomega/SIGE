class IphPeopleController < ApplicationController
  # GET /iph_people
  # GET /iph_people.json
  def index
    @iph_people = IphPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iph_people }
    end
  end

  # GET /iph_people/1
  # GET /iph_people/1.json
  def show
    @iph_person = IphPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph_person }
    end
  end

  # GET /iph_people/new
  # GET /iph_people/new.json
  def new
    @iph_person = IphPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph_person }
    end
  end

  # GET /iph_people/1/edit
  def edit
    @iph_person = IphPerson.find(params[:id])
  end

  # POST /iph_people
  # POST /iph_people.json
  def create
    @iph_person = IphPerson.new(params[:iph_person])

    respond_to do |format|
      if @iph_person.save
        format.html { redirect_to @iph_person, notice: 'Iph person was successfully created.' }
        format.json { render json: @iph_person, status: :created, location: @iph_person }
      else
        format.html { render action: "new" }
        format.json { render json: @iph_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iph_people/1
  # PUT /iph_people/1.json
  def update
    @iph_person = IphPerson.find(params[:id])

    respond_to do |format|
      if @iph_person.update_attributes(params[:iph_person])
        format.html { redirect_to @iph_person, notice: 'Iph person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iph_people/1
  # DELETE /iph_people/1.json
  def destroy
    @iph_person = IphPerson.find(params[:id])
    @iph_person.destroy

    respond_to do |format|
      format.html { redirect_to iph_people_url }
      format.json { head :no_content }
    end
  end
end
