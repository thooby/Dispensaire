# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery
  def requires(role)
    raise CanCan::AccessDenied.new("Requested action can only be performed by " + role.to_s.humanize + "s") unless current_user.is? role
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
