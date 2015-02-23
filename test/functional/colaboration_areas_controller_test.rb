require 'test_helper'

class ColaborationAreasControllerTest < ActionController::TestCase
  setup do
    @colaboration_area = colaboration_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colaboration_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colaboration_area" do
    assert_difference('ColaborationArea.count') do
      post :create, colaboration_area: { area: @colaboration_area.area, id: @colaboration_area.id }
    end

    assert_redirected_to colaboration_area_path(assigns(:colaboration_area))
  end

  test "should show colaboration_area" do
    get :show, id: @colaboration_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colaboration_area
    assert_response :success
  end

  test "should update colaboration_area" do
    put :update, id: @colaboration_area, colaboration_area: { area: @colaboration_area.area, id: @colaboration_area.id }
    assert_redirected_to colaboration_area_path(assigns(:colaboration_area))
  end

  test "should destroy colaboration_area" do
    assert_difference('ColaborationArea.count', -1) do
      delete :destroy, id: @colaboration_area
    end

    assert_redirected_to colaboration_areas_path
  end
end
