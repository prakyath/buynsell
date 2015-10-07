class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :set_product, only: [:create,:destroy]


  def create
  @comment=set_product.comments.new(comment_params)	
  # @comment.message=comment_params[:message]
   
  # @comment.user_id = current_user.id #or whatever is you session name
  
  if @comment.save
    redirect_to @product
  else
    flash.now[:danger] = "error"
  end
  

  end 
  

    def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Product was successfully destroyed.' }
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

end
