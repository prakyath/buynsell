class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :comment_admin,only: :destroy
  before_action :set_product, only: [:new,:create,:destroy]

  def create
    
  # @comment.message=comment_params[:message] 

    #or whatever is you session name
  
  
    @comment=set_product.comments.new(comment_params) 
    @comment.user_id = current_user.id
  if@comment.save
    @notification = Notification.new
    @notification.notifier = current_user
    @notification.notifiee = @product.user
    @notification.product=@product
    @notification.Type="commented"
    @notification.save
    redirect_to @product
  else
    flash[:danger] = "Comment cannot be empty"
    redirect_to @product
  end
  

  end 
  

    def destroy
      @comment = @product.comments.find(params[:id]) 
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @product, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
    end
  end



 private

   def comment_params
        params.require(:comment).permit(:message)
   end

    def set_product
      @product = Product.find(params[:product_id]);
    end

    def comment_admin
      @comment = set_product.comments.find(params[:id])
      if(current_user.id != @comment.user_id )
        redirect_to @product
      end
    end

end