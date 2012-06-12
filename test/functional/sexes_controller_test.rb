require 'test_helper'

class SexesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Sex.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Sex.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Sex.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sex_url(assigns(:sex))
  end

  def test_edit
    get :edit, :id => Sex.first
    assert_template 'edit'
  end

  def test_update_invalid
    Sex.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Sex.first
    assert_template 'edit'
  end

  def test_update_valid
    Sex.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Sex.first
    assert_redirected_to sex_url(assigns(:sex))
  end

  def test_destroy
    sex = Sex.first
    delete :destroy, :id => sex
    assert_redirected_to sexes_url
    assert !Sex.exists?(sex.id)
  end
end
