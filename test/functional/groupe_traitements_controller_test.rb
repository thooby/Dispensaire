# -*- encoding : utf-8 -*-
require 'test_helper'

class GroupeTraitementsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GroupeTraitement.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GroupeTraitement.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GroupeTraitement.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to groupe_traitement_url(assigns(:groupe_traitement))
  end

  def test_edit
    get :edit, :id => GroupeTraitement.first
    assert_template 'edit'
  end

  def test_update_invalid
    GroupeTraitement.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GroupeTraitement.first
    assert_template 'edit'
  end

  def test_update_valid
    GroupeTraitement.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GroupeTraitement.first
    assert_redirected_to groupe_traitement_url(assigns(:groupe_traitement))
  end

  def test_destroy
    groupe_traitement = GroupeTraitement.first
    delete :destroy, :id => groupe_traitement
    assert_redirected_to groupe_traitements_url
    assert !GroupeTraitement.exists?(groupe_traitement.id)
  end
end
