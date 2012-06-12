require 'test_helper'

class TipeconsultationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Tipeconsultation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Tipeconsultation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Tipeconsultation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tipeconsultation_url(assigns(:tipeconsultation))
  end

  def test_edit
    get :edit, :id => Tipeconsultation.first
    assert_template 'edit'
  end

  def test_update_invalid
    Tipeconsultation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tipeconsultation.first
    assert_template 'edit'
  end

  def test_update_valid
    Tipeconsultation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tipeconsultation.first
    assert_redirected_to tipeconsultation_url(assigns(:tipeconsultation))
  end

  def test_destroy
    tipeconsultation = Tipeconsultation.first
    delete :destroy, :id => tipeconsultation
    assert_redirected_to tipeconsultations_url
    assert !Tipeconsultation.exists?(tipeconsultation.id)
  end
end
