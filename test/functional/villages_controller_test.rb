# -*- encoding : utf-8 -*-
require 'test_helper'

class VillagesControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:one)
  end
  
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Village.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Village.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Village.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to village_url(assigns(:village))
  end

  def test_edit
    get :edit, :id => Village.first
    assert_template 'edit'
  end

  def test_update_invalid
    Village.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Village.first
    assert_template 'edit'
  end

  def test_update_valid
    Village.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Village.first
    assert_redirected_to village_url(assigns(:village))
  end

  def test_destroy
    village = Village.first
    delete :destroy, :id => village
    assert_redirected_to villages_url
    assert !Village.exists?(village.id)
  end
  
end
