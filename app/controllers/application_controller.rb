class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
    # !<user instance> -> false (negate that to get true)
    # !nil -> true (negate that to get false)
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def authorized_for_user(user)
    authorized
    if current_user != user
      redirect_to current_user
    end
  end

  def redirect_bad_route
    redirect_to museums_path
  end
end
