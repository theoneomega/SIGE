require 'test_helper'

class FulleventsControllerTest < ActionController::TestCase
  setup do
    @fullevent = fullevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fullevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fullevent" do
    assert_difference('Fullevent.count') do
      post :create, fullevent: { analyst_id: @fullevent.analyst_id, area_id: @fullevent.area_id, backup_file: @fullevent.backup_file, crime_id: @fullevent.crime_id, description: @fullevent.description, event_date: @fullevent.event_date, id: @fullevent.id, interior_number: @fullevent.interior_number, locality: @fullevent.locality, observations: @fullevent.observations, place_id: @fullevent.place_id, priority_id: @fullevent.priority_id, prioteger: @fullevent.prioteger, source: @fullevent.source, status_id: @fullevent.status_id, street: @fullevent.street, suburb: @fullevent.suburb, township_id: @fullevent.township_id }
    end

    assert_redirected_to fullevent_path(assigns(:fullevent))
  end

  test "should show fullevent" do
    get :show, id: @fullevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fullevent
    assert_response :success
  end

  test "should update fullevent" do
    put :update, id: @fullevent, fullevent: { analyst_id: @fullevent.analyst_id, area_id: @fullevent.area_id, backup_file: @fullevent.backup_file, crime_id: @fullevent.crime_id, description: @fullevent.description, event_date: @fullevent.event_date, id: @fullevent.id, interior_number: @fullevent.interior_number, locality: @fullevent.locality, observations: @fullevent.observations, place_id: @fullevent.place_id, priority_id: @fullevent.priority_id, prioteger: @fullevent.prioteger, source: @fullevent.source, status_id: @fullevent.status_id, street: @fullevent.street, suburb: @fullevent.suburb, township_id: @fullevent.township_id }
    assert_redirected_to fullevent_path(assigns(:fullevent))
  end

  test "should destroy fullevent" do
    assert_difference('Fullevent.count', -1) do
      delete :destroy, id: @fullevent
    end

    assert_redirected_to fullevents_path
  end
end
