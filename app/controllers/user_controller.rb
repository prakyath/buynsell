class UserController < ApplicationController
before_action :logged_in_user

def show
  @user=current_user
   @product = Product.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 3)
   flash.now[:error] = "No products" if @product.blank? 
end	

def edit
end
			
def update 
  @user=current_user
    respond_to do |format|	
      if @user.update(user_params)
        format.html { redirect_to user_path, notice: 'Profile was successfully updated.' }
      else
        format.html { render :show }
      end
    end
  end


private
def user_params
      params.require(:user).permit(:fullname,:room,:hostel,:contact,:avatar)
    end

end	


