# -*- encoding : utf-8 -*-
require 'test_helper'

class TraitementsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Traitement.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Traitement.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Traitement.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to traitement_url(assigns(:traitement))
  end

  def test_edit
    get :edit, :id => Traitement.first
    assert_template 'edit'
  end

  def test_update_invalid
    Traitement.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Traitement.first
    assert_template 'edit'
  end

  def test_update_valid
    Traitement.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Traitement.first
    assert_redirected_to traitement_url(assigns(:traitement))
  end

  def test_destroy
    traitement = Traitement.first
    delete :destroy, :id => traitement
    assert_redirected_to traitements_url
    assert !Traitement.exists?(traitement.id)
  end
end
