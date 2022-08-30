class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  include SessionsHelper
  include Pagy::Backend

  private

  def storable_location?
    request.get? && is_navigational_format? &&
      !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for resource
    if current_user.admin?
      (stored_location_for(resource) || admin_home_path)
    else
      (stored_location_for(resource) || root_path)
    end
  end

  def configure_permitted_parameters
    added_attrs = %i(name email password
                   password_confirmation remember_me)
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".please_log_in"
    redirect_to admin_login_path
  end
end
