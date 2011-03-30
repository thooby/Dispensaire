require 'test_helper'

class DiagnosticsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Diagnostic.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Diagnostic.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Diagnostic.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to diagnostic_url(assigns(:diagnostic))
  end

  def test_edit
    get :edit, :id => Diagnostic.first
    assert_template 'edit'
  end

  def test_update_invalid
    Diagnostic.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Diagnostic.first
    assert_template 'edit'
  end

  def test_update_valid
    Diagnostic.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Diagnostic.first
    assert_redirected_to diagnostic_url(assigns(:diagnostic))
  end

  def test_destroy
    diagnostic = Diagnostic.first
    delete :destroy, :id => diagnostic
    assert_redirected_to diagnostics_url
    assert !Diagnostic.exists?(diagnostic.id)
  end
end
