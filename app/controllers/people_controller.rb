class PeopleController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /people
  # GET /people.json
  def index
    @people = Person.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    
    @person.searchable = @person.first_name + " "+ @person.last_name1
    
    if @person.last_name2 != nil
      @person.searchable = @person.searchable + " " + @person.last_name2
    end
    if @person.alias != nil
      @person.searchable = @person.searchable + " "+@person.alias
    end
    if @person.ci != nil
      @person.searchable = @person.searchable + " " + @person.ci
    end
    if @person.observations != nil
      @person.searchable = @person.searchable " " + @person.observations
    end
    if @person.originative != nil
      @person.searchable = @person.searchable + " " + @person.originative
    end    
    if @person.profession != nil
      @person.searchable = @person.searchable + " " + @person.profession
    end
    if @person.status_id != nil
      @person.searchable = @person.searchable + " " + @person.status.description
    end
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    
    @person.searchable = @person.first_name + " "+ @person.last_name1
    
    if @person.last_name2 != nil
      @person.searchable = @person.searchable + " " + @person.last_name2
    end
    if @person.alias != nil
      @person.searchable = @person.searchable + " "+@person.alias
    end
    if @person.ci != nil
      @person.searchable = @person.searchable + " " + @person.ci
    end
    
    
    if @person.observations != nil
      @person.searchable = @person.searchable + " " + @person.observations
    end
    
    
    if @person.originative != nil
      @person.searchable = @person.searchable + " " + @person.originative
    end    
    if @person.profession != nil
      @person.searchable = @person.searchable + " " + @person.profession
    end
    if @person.status_id != nil
      @person.searchable = @person.searchable + " " + @person.status.description
    end

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
end
