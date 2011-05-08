require 'test_helper'

class InfEntitiesControllerTest < ActionController::TestCase
  setup do
    @inf_entity = inf_entities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inf_entities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inf_entity" do
    assert_difference('InfEntity.count') do
      post :create, :inf_entity => @inf_entity.attributes
    end

    assert_redirected_to inf_entity_path(assigns(:inf_entity))
  end

  test "should show inf_entity" do
    get :show, :id => @inf_entity.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @inf_entity.to_param
    assert_response :success
  end

  test "should update inf_entity" do
    put :update, :id => @inf_entity.to_param, :inf_entity => @inf_entity.attributes
    assert_redirected_to inf_entity_path(assigns(:inf_entity))
  end

  test "should destroy inf_entity" do
    assert_difference('InfEntity.count', -1) do
      delete :destroy, :id => @inf_entity.to_param
    end

    assert_redirected_to inf_entities_path
  end
end
