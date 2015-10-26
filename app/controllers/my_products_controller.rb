class MyProductsController < ApplicationController
  def index
  	@product = Product.where(user_id: current_user.id)
  	flash[:error] = "No products" if @product.blank? 
  end
end
