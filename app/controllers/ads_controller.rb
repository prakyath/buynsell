class AdsController < ApplicationController

before_action :logged_in_user,only: [:new,:edit,:show]
before_action :correct_user,only: [:edit,:destroy]
before_action :set_ad, only: [:show, :edit, :update, :destroy]
  def index
    @products = Ad.all.order('created_at DESC')
  end

  # GET /products/1
  # GET /products/1.json

  # GET /products/new
  def new
    @ad = current_user.ads.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @ad = current_user.ads.build(ad_params)
    
    respond_to do |format|
      if @ad.save

          #@product=product.new(product_params)
          #@product.images.create(image: image)
        format.html { redirect_to ads_path, notice: 'Post was successfully created.' }

         # @product.images.create(image: image)
        format.json { render :index, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to ads_path, notice: 'Post was successfully updated.' }
        format.json { render :index, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :reason, :user_id,:image,:status,:category_id)
    end

    def correct_user
      @product = current_user.products.find_by(id:  params[:id])
      redirect_to root_url if @product.nil?
    end
end
