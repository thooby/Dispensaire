# -*- encoding : utf-8 -*-
require 'test_helper'

class EthniesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Ethnie.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Ethnie.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Ethnie.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ethnie_url(assigns(:ethnie))
  end

  def test_edit
    get :edit, :id => Ethnie.first
    assert_template 'edit'
  end

  def test_update_invalid
    Ethnie.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ethnie.first
    assert_template 'edit'
  end

  def test_update_valid
    Ethnie.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ethnie.first
    assert_redirected_to ethnie_url(assigns(:ethnie))
  end

  def test_destroy
    ethnie = Ethnie.first
    delete :destroy, :id => ethnie
    assert_redirected_to ethnies_url
    assert !Ethnie.exists?(ethnie.id)
  end
end
