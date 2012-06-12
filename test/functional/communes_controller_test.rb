require 'test_helper'

class CommunesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Commune.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Commune.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Commune.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to commune_url(assigns(:commune))
  end

  def test_edit
    get :edit, :id => Commune.first
    assert_template 'edit'
  end

  def test_update_invalid
    Commune.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Commune.first
    assert_template 'edit'
  end

  def test_update_valid
    Commune.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Commune.first
    assert_redirected_to commune_url(assigns(:commune))
  end

  def test_destroy
    commune = Commune.first
    delete :destroy, :id => commune
    assert_redirected_to communes_url
    assert !Commune.exists?(commune.id)
  end
end
