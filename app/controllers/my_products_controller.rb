class MyProductsController < ApplicationController
  def index
  	@category = Category.all
  	@product = Product.where(user_id: current_user.id)
  	flash.now[:error] = "No products" if @product.blank? 
  end
end
