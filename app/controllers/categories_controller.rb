class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
    @products = @category.products
	end

	def index
		@category = Category.all
	end

	def new
		@category = Category.new
	end

	def create
    @category = Category.create(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  	def category_params
  		params.require(:category).permit(:name)
  	end

    def category_layout
      @category = Category.all
    end

end
