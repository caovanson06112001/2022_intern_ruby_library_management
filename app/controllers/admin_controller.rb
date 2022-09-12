class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :block_user

  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json{head :forbidden, content_type: "text/html"}
      format.html do
        redirect_back fallback_location: admin_books_path,
                      alert: exception.message
      end
      format.js{head :forbidden, content_type: "text/html"}
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    store_location
    redirect_to admin_users_path
    flash[:danger] = t "user.find_error"
  end

  def find_category
    @category = Category.find_by id: params[:id]
    return if @category

    store_location
    redirect_to admin_category_index_path
    flash[:danger] = t "category.find_error"
  end

  def block_user
    redirect_to root_path if current_user.user?
  end
end
