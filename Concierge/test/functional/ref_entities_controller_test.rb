require 'test_helper'

class RefEntitiesControllerTest < ActionController::TestCase
  setup do
    @ref_entity = ref_entities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_entities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_entity" do
    assert_difference('RefEntity.count') do
      post :create, :ref_entity => @ref_entity.attributes
    end

    assert_redirected_to ref_entity_path(assigns(:ref_entity))
  end

  test "should show ref_entity" do
    get :show, :id => @ref_entity.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ref_entity.to_param
    assert_response :success
  end

  test "should update ref_entity" do
    put :update, :id => @ref_entity.to_param, :ref_entity => @ref_entity.attributes
    assert_redirected_to ref_entity_path(assigns(:ref_entity))
  end

  test "should destroy ref_entity" do
    assert_difference('RefEntity.count', -1) do
      delete :destroy, :id => @ref_entity.to_param
    end

    assert_redirected_to ref_entities_path
  end
end
