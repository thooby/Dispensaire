# -*- encoding : utf-8 -*-
require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Patient.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Patient.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Patient.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to patient_url(assigns(:patient))
  end

  def test_edit
    get :edit, :id => Patient.first
    assert_template 'edit'
  end

  def test_update_invalid
    Patient.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Patient.first
    assert_template 'edit'
  end

  def test_update_valid
    Patient.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Patient.first
    assert_redirected_to patient_url(assigns(:patient))
  end

  def test_not_destroy
    patient = Patient.first
    delete :destroy, :id => patient
    assert_redirected_to patients_url
    assert Patient.exists?(patient.id)
  end

  def test_destroy
    patient = Patient.all[1]
    delete :destroy, :id => patient
    assert_redirected_to patients_url
    assert !Patient.exists?(patient.id)
  end
end
