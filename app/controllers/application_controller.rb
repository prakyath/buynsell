class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :categories

  include CommentHelper
  include SessionsHelper
  include OauthHelper

  def categories
    @category = Category.all
  end
end