class ProductFollowersController < ApplicationController
  before_action :set_product_follower, only: [:show, :edit, :update, :destroy]

  # GET /product_followers
  # GET /product_followers.json
  def create
    @product_follower = current_user.product_followers.build(:follower_id => params[:follower_id])

      if @product_follower.save
        flash[:notice] = "Product Followed"
      redirect_to root_url
      else
        flash[:error] = "Unable to follow product."
      redirect_to root_url
      end
  end

  def destroy
    
    @product_follower=current_user.product_followers.find(params[:id])
    @product_follower.destroy
    flash[:notice] = "Removed product."
    redirect_to current_user
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_product_follower
      @product_follower = ProductFollower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_follower_params
      params.require(:product_follower).permit(:product_id, :follower_id)
    end
end
