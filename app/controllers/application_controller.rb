class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
      { lang: I18n.locale }
  end
  
  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello, #{current_user.first_name}!"
    if current_user.admin?
      admin_tests_path
    else
      super
    end
  end
end
