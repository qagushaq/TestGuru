class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :redirect_back_or

  private

  def authenticate_user!
    unless current_user
      redirect_url
      redirect_to login_path, alert: 'You need to login!'
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_url
    cookies[:forwarding_url] = request.original_url if request.get?
  end

  def redirect_back_or(default)
    redirect_to(cookies[:forwarding_url] || default)
    cookies.delete(:forwarding_url)
  end

end
