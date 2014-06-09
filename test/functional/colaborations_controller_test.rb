require 'test_helper'

class ColaborationsControllerTest < ActionController::TestCase
  setup do
    @colaboration = colaborations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colaborations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colaboration" do
    assert_difference('Colaboration.count') do
      post :create, colaboration: { analyst_id: @colaboration.analyst_id, area_id: @colaboration.area_id, claimant: @colaboration.claimant, colaboration_date: @colaboration.colaboration_date, id: @colaboration.id, observations: @colaboration.observations, received_for: @colaboration.received_for, replied_for: @colaboration.replied_for, reply_date: @colaboration.reply_date, requesting_area: @colaboration.requesting_area, status_id: @colaboration.status_id }
    end

    assert_redirected_to colaboration_path(assigns(:colaboration))
  end

  test "should show colaboration" do
    get :show, id: @colaboration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colaboration
    assert_response :success
  end

  test "should update colaboration" do
    put :update, id: @colaboration, colaboration: { analyst_id: @colaboration.analyst_id, area_id: @colaboration.area_id, claimant: @colaboration.claimant, colaboration_date: @colaboration.colaboration_date, id: @colaboration.id, observations: @colaboration.observations, received_for: @colaboration.received_for, replied_for: @colaboration.replied_for, reply_date: @colaboration.reply_date, requesting_area: @colaboration.requesting_area, status_id: @colaboration.status_id }
    assert_redirected_to colaboration_path(assigns(:colaboration))
  end

  test "should destroy colaboration" do
    assert_difference('Colaboration.count', -1) do
      delete :destroy, id: @colaboration
    end

    assert_redirected_to colaborations_path
  end
end
