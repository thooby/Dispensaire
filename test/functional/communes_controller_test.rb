# -*- encoding : utf-8 -*-
require 'test_helper'

class CommunesControllerTest < ActionController::TestCase
  
  context "not logged in" do
    should "get index" do
      get :index
      assert_template 'index'
    end
    should "not get new" do
      get :new
      assert_response :redirect      
    end  
  end  
  
  ['visiteur', 'chercheur', 'sanitaire'].each do |role|
    context "logged in as #{role}" do
      setup do 
        login_as(role)
      end  
      should "get index" do
        get :index
        assert_response :redirect
      end  
      should "not get new" do
        get :new
        assert_response :redirect      
      end
    end  
  end  

  context "logged in as admin" do
    setup do
      login_as(:admin)
    end

    should "get index" do
      get :index
      assert_template 'index'
    end

    should "get new" do
      get :new
      assert_template 'new'
    end
      
    should "create valid" do
      Commune.any_instance.stubs(:valid?).returns(true)
      post :create
      assert_redirected_to commune_url(assigns(:commune))    
    end

    should "not create invalid" do
      Commune.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'    
    end  

    context "with commune" do
      setup do
        @commune = FactoryGirl.create(:commune)
      end  

      should "get show" do
        get :show, :id => @commune.id
        assert_template 'show'
      end

      should "get edit" do
        get :edit, :id => @commune.id
        assert_template 'edit'
      end  

      should "not update invalid" do
        Commune.any_instance.stubs(:valid?).returns(false)
        put :update, :id => @commune.id
        assert_template 'edit'      
      end  

      should "update valid" do
        Commune.any_instance.stubs(:valid?).returns(true)
        put :update, :id => @commune.id
        assert_redirected_to commune_url(assigns(:commune))
      end  

      should "destroy" do
        delete :destroy, :id => @commune.id
        assert_redirected_to communes_url
        assert !Commune.exists?(@commune.id)
      end  
    end  
  end  

end
