require 'test_helper'

class IphObjectsControllerTest < ActionController::TestCase
  setup do
    @iph_object = iph_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iph_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph_object" do
    assert_difference('IphObject.count') do
      post :create, iph_object: { amount: @iph_object.amount, description: @iph_object.description, id: @iph_object.id, object: @iph_object.object }
    end

    assert_redirected_to iph_object_path(assigns(:iph_object))
  end

  test "should show iph_object" do
    get :show, id: @iph_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph_object
    assert_response :success
  end

  test "should update iph_object" do
    put :update, id: @iph_object, iph_object: { amount: @iph_object.amount, description: @iph_object.description, id: @iph_object.id, object: @iph_object.object }
    assert_redirected_to iph_object_path(assigns(:iph_object))
  end

  test "should destroy iph_object" do
    assert_difference('IphObject.count', -1) do
      delete :destroy, id: @iph_object
    end

    assert_redirected_to iph_objects_path
  end
end
