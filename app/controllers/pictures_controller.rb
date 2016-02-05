class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index

    @product = Product.find(params[:product_id])

    @pictures = @product.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @product = Product.find(params[:product_id])
    @picture = @product.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    #@product = Product.find(params[:Product_id])

    @picture = Picture.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @product = Product.find(params[:product_id])

    @picture = @product.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(picture_params)
        format.html { redirect_to product_path(@product), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    #@Product = Product.find(params[:Product_id])
    #@picture = @Product.pictures.find(params[:id])
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @product = Product.find(params[:product_id])

    @product.cover = @picture.id
    @product.save

    respond_to do |format|
      format.js
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:product_id, :image)
  end
end