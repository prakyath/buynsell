class ProductsController < ApplicationController
before_action :logged_in_user,only: [:new,:edit,:show]
before_action :correct_user,only: [:edit,:destroy]
before_action :set_product, only: [:show, :edit, :update, :destroy]
autocomplete :product, :name
after_action :mail , only: [:create]
caches_page :show, :new ,:index


  def index
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    elsif params[:category_id]
       @products = Product.where(category_id: params[:category_id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)  
    else
      @products = Product.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 20)
    end
    @category = Category.all

    respond_to do |format|
      format.html
      format.json { @books = Book.search(params[:term]) }
  end
  end

  def show
    @product = Product.find(params[:id])
    @pictures=@product.pictures
    @category_id = @product.category_id
    @category1 = Category.find_by(id: @category_id)
    @comments = Comment.includes(:user)
  end

  def new
    @product = current_user.products.build
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)
    respond_to do |format|
      if @product.save
        if params[:images]
          params[:images].each { |image|
            @product.pictures.create(image: image)
          }
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end

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

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  def make_offer
    respond_to do |format|
      format.html
      format.js
    end
  end
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :reason, :user_id,:status,:category_id,pictures_attributes: [:image])
    end

    def correct_user
      @product = current_user.products.find_by(id:  params[:id])
      redirect_to root_url if @product.nil?
    end
    def mail
     #   Logins.login_mail(current_user,@product).deliver
    end
end
