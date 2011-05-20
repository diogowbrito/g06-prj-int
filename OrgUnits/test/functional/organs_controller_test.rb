require 'test_helper'

class OrgansControllerTest < ActionController::TestCase
  setup do
    @organ = organs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organ" do
    assert_difference('Organ.count') do
      post :create, :organ => @organ.attributes
    end

    assert_redirected_to organ_path(assigns(:organ))
  end

  test "should show organ" do
    get :show, :id => @organ.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @organ.to_param
    assert_response :success
  end

  test "should update organ" do
    put :update, :id => @organ.to_param, :organ => @organ.attributes
    assert_redirected_to organ_path(assigns(:organ))
  end

  test "should destroy organ" do
    assert_difference('Organ.count', -1) do
      delete :destroy, :id => @organ.to_param
    end

    assert_redirected_to organs_path
  end
end
