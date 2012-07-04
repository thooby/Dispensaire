# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access defendu."
    redirect_to root_url
  end
  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    @current_user = current_user_session && current_user_session.record
  end
end
