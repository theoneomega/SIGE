class IphWeaponsController < ApplicationController
  # GET /iph_weapons
  # GET /iph_weapons.json
  def index
    @iph_weapons = IphWeapon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iph_weapons }
    end
  end

  # GET /iph_weapons/1
  # GET /iph_weapons/1.json
  def show
    @iph_weapon = IphWeapon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph_weapon }
    end
  end

  # GET /iph_weapons/new
  # GET /iph_weapons/new.json
  def new
    @iph_weapon = IphWeapon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph_weapon }
    end
  end

  # GET /iph_weapons/1/edit
  def edit
    @iph_weapon = IphWeapon.find(params[:id])
  end

  # POST /iph_weapons
  # POST /iph_weapons.json
  def create
    @iph_weapon = IphWeapon.new(params[:iph_weapon])

    respond_to do |format|
      if @iph_weapon.save
        format.html { redirect_to @iph_weapon, notice: 'Iph weapon was successfully created.' }
        format.json { render json: @iph_weapon, status: :created, location: @iph_weapon }
      else
        format.html { render action: "new" }
        format.json { render json: @iph_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iph_weapons/1
  # PUT /iph_weapons/1.json
  def update
    @iph_weapon = IphWeapon.find(params[:id])

    respond_to do |format|
      if @iph_weapon.update_attributes(params[:iph_weapon])
        format.html { redirect_to @iph_weapon, notice: 'Iph weapon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iph_weapons/1
  # DELETE /iph_weapons/1.json
  def destroy
    @iph_weapon = IphWeapon.find(params[:id])
    @iph_weapon.destroy

    respond_to do |format|
      format.html { redirect_to iph_weapons_url }
      format.json { head :no_content }
    end
  end
end
