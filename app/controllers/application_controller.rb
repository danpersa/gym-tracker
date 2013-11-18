class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def permission_denied
    render file: "public/401.html", layout: false, status: :unauthorized
  end

  def current_user
    return nil if session[:user_id].nil?
    @current_user ||= User.where(_id: session[:user_id]).first
    if @current_user.nil?
      return nil
    end
    return @current_user
  end
  helper_method :current_user
end
