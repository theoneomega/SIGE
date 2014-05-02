require 'test_helper'

class CriminalGroupsControllerTest < ActionController::TestCase
  setup do
    @criminal_group = criminal_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criminal_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criminal_group" do
    assert_difference('CriminalGroup.count') do
      post :create, criminal_group: { area_id: @criminal_group.area_id, description: @criminal_group.description, drug_id: @criminal_group.drug_id, id: @criminal_group.id, vehicle_id: @criminal_group.vehicle_id, weapon_id: @criminal_group.weapon_id }
    end

    assert_redirected_to criminal_group_path(assigns(:criminal_group))
  end

  test "should show criminal_group" do
    get :show, id: @criminal_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criminal_group
    assert_response :success
  end

  test "should update criminal_group" do
    put :update, id: @criminal_group, criminal_group: { area_id: @criminal_group.area_id, description: @criminal_group.description, drug_id: @criminal_group.drug_id, id: @criminal_group.id, vehicle_id: @criminal_group.vehicle_id, weapon_id: @criminal_group.weapon_id }
    assert_redirected_to criminal_group_path(assigns(:criminal_group))
  end

  test "should destroy criminal_group" do
    assert_difference('CriminalGroup.count', -1) do
      delete :destroy, id: @criminal_group
    end

    assert_redirected_to criminal_groups_path
  end
end
