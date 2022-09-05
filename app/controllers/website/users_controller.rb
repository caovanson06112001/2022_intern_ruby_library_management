class Website::UsersController < WebsiteController
  before_action :authenticate_user!
  before_action :find_user, only: :show

  def show; end

  private

  def find_user
    @user = User.find_by id: params[:id]
  end
end
