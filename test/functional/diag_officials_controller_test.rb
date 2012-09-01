require 'test_helper'

class DiagOfficialsControllerTest < ActionController::TestCase
  setup do
    @diag_official = diag_officials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diag_officials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diag_official" do
    assert_difference('DiagOfficial.count') do
      post :create, :diag_official => @diag_official.attributes
    end

    assert_redirected_to diag_official_path(assigns(:diag_official))
  end

  test "should show diag_official" do
    get :show, :id => @diag_official.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @diag_official.to_param
    assert_response :success
  end

  test "should update diag_official" do
    put :update, :id => @diag_official.to_param, :diag_official => @diag_official.attributes
    assert_redirected_to diag_official_path(assigns(:diag_official))
  end

  test "should destroy diag_official" do
    assert_difference('DiagOfficial.count', -1) do
      delete :destroy, :id => @diag_official.to_param
    end

    assert_redirected_to diag_officials_path
  end
end
