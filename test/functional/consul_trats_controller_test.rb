# -*- encoding : utf-8 -*-
require 'test_helper'

class ConsulTratsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ConsulTrat.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ConsulTrat.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ConsulTrat.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to consul_trat_url(assigns(:consul_trat))
  end

  def test_edit
    get :edit, :id => ConsulTrat.first
    assert_template 'edit'
  end

  def test_update_invalid
    ConsulTrat.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ConsulTrat.first
    assert_template 'edit'
  end

  def test_update_valid
    ConsulTrat.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ConsulTrat.first
    assert_redirected_to consul_trat_url(assigns(:consul_trat))
  end

  def test_destroy
    consul_trat = ConsulTrat.first
    delete :destroy, :id => consul_trat
    assert_redirected_to consul_trats_url
    assert !ConsulTrat.exists?(consul_trat.id)
  end
end
