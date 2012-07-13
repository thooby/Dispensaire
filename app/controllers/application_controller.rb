# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  before_filter :login_required
  helper_method :current_user
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access defendu."
    redirect_to root_url
  end
  
  private
  def login_required
    logged_in? ? true : access_denied
  end

  def logged_in?
    current_user ? true : false 
  end
  def access_denied
    
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    @current_user = current_user_session && current_user_session.record
  end
end
