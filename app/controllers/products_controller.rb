class ProductsController < ApplicationController
before_action :logged_in_user,only: [:new,:edit]
before_action :correct_user,only: [:edit,:destroy]
before_action :set_product, only: [:show, :edit, :update, :destroy]
autocomplete :product, :name
  def index
    @recent = Product.all.order('created_at DESC').limit('3')
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
    else
      @products = Product.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
    end
    @category = Category.all
    respond_to do |format|
      format.html
      format.json { @books = Book.search(params[:term]) }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @comment = @product.comments.build
    @category_id = @product.category_id
    @category1 = Category.find_by(id: @category_id)

  end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)
    
    respond_to do |format|
      if @product.save

          #@product=product.new(product_params)
          #@product.images.create(image: image)
        format.html { redirect_to @product, notice: 'Product was successfully created.' }

         # @product.images.create(image: image)
        format.json { render :show, status: :created, location: @product }
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
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
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
