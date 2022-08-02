class AdminController < ApplicationController
  before_action :logged_in_user

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    store_location
    redirect_to admin_users_path
    flash[:danger] = t "user.find_error"
  end

  def find_category
    @category = CategoryBook.find_by id: params[:id]
    return if @category

    store_location
    redirect_to admin_category_index_path
    flash[:danger] = t "category.find_error"
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:message] = t "user_login.is_login"
    redirect_to admin_login_path
  end
end
