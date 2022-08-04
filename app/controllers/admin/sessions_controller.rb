class Admin::SessionsController < ApplicationController
  before_action :find_by_email, only: :create

  def new; end

  def create
    if @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_to admin_home_path
    else
      flash.now[:danger] = t "invalid_email_password_combination"
      redirect_to admin_login_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_login_path
  end

  private

  def find_by_email
    @user = User.find_by email: params.dig(:session, :email)&.downcase
    return if @user

    flash[:danger] = t "login.error_login"
    redirect_to admin_login_path
  end
end
