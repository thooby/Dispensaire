require 'test_helper'

class ConsultationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Consultation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Consultation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Consultation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to consultation_url(assigns(:consultation))
  end

  def test_edit
    get :edit, :id => Consultation.first
    assert_template 'edit'
  end

  def test_update_invalid
    Consultation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Consultation.first
    assert_template 'edit'
  end

  def test_update_valid
    Consultation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Consultation.first
    assert_redirected_to consultation_url(assigns(:consultation))
  end

  def test_destroy
    consultation = Consultation.first
    delete :destroy, :id => consultation
    assert_redirected_to consultations_url
    assert !Consultation.exists?(consultation.id)
  end
end
