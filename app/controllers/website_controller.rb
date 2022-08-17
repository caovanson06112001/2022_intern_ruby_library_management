class WebsiteController < ApplicationController
  protect_from_forgery with: :exception
  include OrdersHelper
end
