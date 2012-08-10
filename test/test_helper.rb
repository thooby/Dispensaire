# -*- encoding : utf-8 -*-
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "authlogic/test_case"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all
  # Add more helper methods to be used by all tests here...
end

def login_as(role)
  user = FactoryGirl.create(:user, :role => role)
  old_controller = @controller
  @controller = UserSessionsController.new
  post :create, :user_session => {:username => user.username, :password => '1234'}
  assert_not_nil(UserSession.find)
  @controller = old_controller
end
