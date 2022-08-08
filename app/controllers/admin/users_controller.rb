class Admin::UsersController < AdminController
  before_action :find_user, except: %i(index)

  def index
    @pagy, @users = pagy User.latest_user,
                         items: Settings.max_page_user
  end

  def show
    if @user
      render json: {user: @user, code: 200}
    else
      render json: {message: t("users.not_found"), code: 404}
    end
  end

  def update
    if @user.admin?
      render json: {message: t("users.activate_ff"), code: 404}
    else
      @user.activate_admin
      render json: {message: t("users.activate_ss"), code: 200}
    end
  end
end
