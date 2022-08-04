class Admin::CategoryController < AdminController
  def index
    @pagy, @categories = pagy CategoryBook.all
  end

  def new; end

  def create; end

  def destroy; end
end
