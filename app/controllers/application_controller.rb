class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def logged_in? 
    !current_user.nil?
  end

  def authentication_required
    redirect_to login_path if !logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def current_user?(user)
    user == current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = 'You must be logged in to perform this action'
      redirect_to root_path
    end
  end

  helper_method :current_user, :logged_in?, :current_user?, :require_user
end
