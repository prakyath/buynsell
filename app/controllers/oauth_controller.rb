class OauthController < ApplicationController
	def index
		#@posts = Post.where("solved=?",false).order('created_at DESC')
		@redirect_uri = request.original_url
		@auth_code = params[:authorization_code]	
		if session[:access_token]
			@access_token = session[:access_token]
		end	

		if @access_token
			generate_access_req
     		get_user
     		if @user==nil
     			session[:access_token]=nil
     		else
   
     		@username=@user['username'].downcase

     		   if @access_token
	     		session[:username]=@username
	     		session[:user_id]=@user['id']
	     		@student = User.find_by(username: @username)
	     		if @username
	     			log_in @student
	     		else
	     			redirect_to root_url
	     		end
			   end	
	        end
		elsif  @auth_code
			   	generate_token_req
      			get_token
      			session[:access_token] =@access_token
   				redirect_to  @redirect_uri


		else
			generate_auth_req
		      if($PRIVATE_SITE) 

		       redirect_to @auth_url
		      
		      else 
		        @signin_url = @auth_url
      		  end

		end


	
	end	

	def signout
		session.delete(:access_token)
        session.delete(:user_id)
        self.current_user = nil
		redirect=request.original_url
		@redirect_uri=redirect.split('/logout')[0]
		#raise @redirect_uri[0].inspect
		#@redirect_uri=@redirect[0]
		
		@signout = $AUTH_SERVER +$CMD_SIGNOUT + "?response_type="+ $RESPONSE_TYPE +"&client_id=" +$CLIENT_ID +"&redirect_uri="+@redirect_uri +"&scope="+ $SCOPE +"&state=" +$STATE
		redirect_to @signout
	end

end
