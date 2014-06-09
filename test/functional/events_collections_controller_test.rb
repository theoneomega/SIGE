require 'test_helper'

class EventsCollectionsControllerTest < ActionController::TestCase
  setup do
    @events_collection = events_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create events_collection" do
    assert_difference('EventsCollection.count') do
      post :create, events_collection: { analyst_id: @events_collection.analyst_id, area_id: @events_collection.area_id, backup_file: @events_collection.backup_file, crime_id: @events_collection.crime_id, description: @events_collection.description, drug_id: @events_collection.drug_id, event_date: @events_collection.event_date, id: @events_collection.id, interior_number: @events_collection.interior_number, locality: @events_collection.locality, locality_id: @events_collection.locality_id, observations: @events_collection.observations, person_id: @events_collection.person_id, place_id: @events_collection.place_id, priority_id: @events_collection.priority_id, source: @events_collection.source, status_id: @events_collection.status_id, street: @events_collection.street, suburb: @events_collection.suburb, township_id: @events_collection.township_id, vehicle_id: @events_collection.vehicle_id, weapon_id: @events_collection.weapon_id }
    end

    assert_redirected_to events_collection_path(assigns(:events_collection))
  end

  test "should show events_collection" do
    get :show, id: @events_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @events_collection
    assert_response :success
  end

  test "should update events_collection" do
    put :update, id: @events_collection, events_collection: { analyst_id: @events_collection.analyst_id, area_id: @events_collection.area_id, backup_file: @events_collection.backup_file, crime_id: @events_collection.crime_id, description: @events_collection.description, drug_id: @events_collection.drug_id, event_date: @events_collection.event_date, id: @events_collection.id, interior_number: @events_collection.interior_number, locality: @events_collection.locality, locality_id: @events_collection.locality_id, observations: @events_collection.observations, person_id: @events_collection.person_id, place_id: @events_collection.place_id, priority_id: @events_collection.priority_id, source: @events_collection.source, status_id: @events_collection.status_id, street: @events_collection.street, suburb: @events_collection.suburb, township_id: @events_collection.township_id, vehicle_id: @events_collection.vehicle_id, weapon_id: @events_collection.weapon_id }
    assert_redirected_to events_collection_path(assigns(:events_collection))
  end

  test "should destroy events_collection" do
    assert_difference('EventsCollection.count', -1) do
      delete :destroy, id: @events_collection
    end

    assert_redirected_to events_collections_path
  end
end
