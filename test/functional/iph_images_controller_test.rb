require 'test_helper'

class IphImagesControllerTest < ActionController::TestCase
  setup do
    @iph_image = iph_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iph_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph_image" do
    assert_difference('IphImage.count') do
      post :create, iph_image: { id: @iph_image.id, iph_id: @iph_image.iph_id, name: @iph_image.name }
    end

    assert_redirected_to iph_image_path(assigns(:iph_image))
  end

  test "should show iph_image" do
    get :show, id: @iph_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph_image
    assert_response :success
  end

  test "should update iph_image" do
    put :update, id: @iph_image, iph_image: { id: @iph_image.id, iph_id: @iph_image.iph_id, name: @iph_image.name }
    assert_redirected_to iph_image_path(assigns(:iph_image))
  end

  test "should destroy iph_image" do
    assert_difference('IphImage.count', -1) do
      delete :destroy, id: @iph_image
    end

    assert_redirected_to iph_images_path
  end
end
