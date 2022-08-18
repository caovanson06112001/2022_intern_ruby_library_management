class Website::CartsController < WebsiteController
  before_action :logged_in_user

  def index
    @order = current_user.order.latest
  end

  def destroy; end
end
