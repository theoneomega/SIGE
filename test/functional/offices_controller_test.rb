require 'test_helper'

class OfficesControllerTest < ActionController::TestCase
  setup do
    @office = offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office" do
    assert_difference('Office.count') do
      post :create, office: { analyst_id: @office.analyst_id, area_id: @office.area_id, claimant: @office.claimant, id: @office.id, observations: @office.observations, office_date: @office.office_date, office_number: @office.office_number, received_date: @office.received_date, replied_date: @office.replied_date, requesting_area: @office.requesting_area, status_id: @office.status_id, subject: @office.subject, user_id: @office.user_id }
    end

    assert_redirected_to office_path(assigns(:office))
  end

  test "should show office" do
    get :show, id: @office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office
    assert_response :success
  end

  test "should update office" do
    put :update, id: @office, office: { analyst_id: @office.analyst_id, area_id: @office.area_id, claimant: @office.claimant, id: @office.id, observations: @office.observations, office_date: @office.office_date, office_number: @office.office_number, received_date: @office.received_date, replied_date: @office.replied_date, requesting_area: @office.requesting_area, status_id: @office.status_id, subject: @office.subject, user_id: @office.user_id }
    assert_redirected_to office_path(assigns(:office))
  end

  test "should destroy office" do
    assert_difference('Office.count', -1) do
      delete :destroy, id: @office
    end

    assert_redirected_to offices_path
  end
end
