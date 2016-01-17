class ToggleStatusController < ApplicationController
  def update
    @product = Product.find(params[:product_id])
    if @product.toggle(params[:switch])
      flash[:success] = "Success!"
      redirect_to @product
    else
      flash[:error] = "Problem toggling"
    end
  end
end
