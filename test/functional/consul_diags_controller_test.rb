# -*- encoding : utf-8 -*-
require 'test_helper'

class ConsulDiagsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ConsulDiag.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ConsulDiag.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ConsulDiag.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to consul_diag_url(assigns(:consul_diag))
  end

  def test_edit
    get :edit, :id => ConsulDiag.first
    assert_template 'edit'
  end

  def test_update_invalid
    ConsulDiag.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ConsulDiag.first
    assert_template 'edit'
  end

  def test_update_valid
    ConsulDiag.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ConsulDiag.first
    assert_redirected_to consul_diag_url(assigns(:consul_diag))
  end

  def test_destroy
    consul_diag = ConsulDiag.first
    delete :destroy, :id => consul_diag
    assert_redirected_to consul_diags_url
    assert !ConsulDiag.exists?(consul_diag.id)
  end
end
