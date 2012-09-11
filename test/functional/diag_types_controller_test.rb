require 'test_helper'

class DiagTypesControllerTest < ActionController::TestCase
  setup do
    @diag_type = diag_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diag_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diag_type" do
    assert_difference('DiagType.count') do
      post :create, :diag_type => @diag_type.attributes
    end

    assert_redirected_to diag_type_path(assigns(:diag_type))
  end

  test "should show diag_type" do
    get :show, :id => @diag_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @diag_type.to_param
    assert_response :success
  end

  test "should update diag_type" do
    put :update, :id => @diag_type.to_param, :diag_type => @diag_type.attributes
    assert_redirected_to diag_type_path(assigns(:diag_type))
  end

  test "should destroy diag_type" do
    assert_difference('DiagType.count', -1) do
      delete :destroy, :id => @diag_type.to_param
    end

    assert_redirected_to diag_types_path
  end
end
