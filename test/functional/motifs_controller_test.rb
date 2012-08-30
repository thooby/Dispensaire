require 'test_helper'

class MotifsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Motif.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Motif.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Motif.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to motif_url(assigns(:motif))
  end

  def test_edit
    get :edit, :id => Motif.first
    assert_template 'edit'
  end

  def test_update_invalid
    Motif.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Motif.first
    assert_template 'edit'
  end

  def test_update_valid
    Motif.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Motif.first
    assert_redirected_to motif_url(assigns(:motif))
  end

  def test_destroy
    motif = Motif.first
    delete :destroy, :id => motif
    assert_redirected_to motifs_url
    assert !Motif.exists?(motif.id)
  end
end
