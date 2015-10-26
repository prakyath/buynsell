module CommentHelper
	def comment_nil?
		!comment.nil?
	end
	def set_product
		@product = Product.find(params[:id])
	end
   def comment
  	     @comment = set_product.comments.find_by(params[:id])
    end
end
