class UserController < ApplicationController
before_action :logged_in_user

def show
@user=current_user
end	

def edit
end
			
def update
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
      params.require(:user).permit(:fullname,:room,:hostel,:contact)
    end

end	

