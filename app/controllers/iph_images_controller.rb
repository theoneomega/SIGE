class IphImagesController < ApplicationController
  def index
    @iph_images = IphImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iph_images.map{|image| image.to_jq_upload} }
    end
  end

  def show
    @iph_image = IphImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iph_image }
    end
  end

  def new
    @iph_image = IphImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iph_image }
    end
  end

  def edit
    @iph_image = IphImage.find(params[:id])
  end

  def create
    @iph_image = IphImage.new(params[:iph_image])

    respond_to do |format|
      if @iph_image.save
        format.html {
          render :json => [@iph_image.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json:{files: [@iph_image.to_jq_upload]}, status: :created, location: @iph_image }
      else
        format.html { render action: "new" }
        format.json { render json: @iph_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @iph_image = IphImage.find(params[:id])

    respond_to do |format|
      if @iph_image.update_attributes(params[:iph_image])
        format.html { redirect_to @iph_image, notice: 'Iph image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iph_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @iph_image = IphImage.find(params[:id])
    @iph_image.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
