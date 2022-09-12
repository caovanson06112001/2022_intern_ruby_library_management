class Admin::HomeController < AdminController
  authorize_resource class: false

  def index; end
end
