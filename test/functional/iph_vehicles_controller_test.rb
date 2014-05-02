require 'test_helper'

class IphVehiclesControllerTest < ActionController::TestCase
  setup do
    @iph_vehicle = iph_vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iph_vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph_vehicle" do
    assert_difference('IphVehicle.count') do
      post :create, iph_vehicle: { brand: @iph_vehicle.brand, color: @iph_vehicle.color, details: @iph_vehicle.details, id: @iph_vehicle.id, line: @iph_vehicle.line, model: @iph_vehicle.model, plate: @iph_vehicle.plate, serial_number: @iph_vehicle.serial_number, stolen: @iph_vehicle.stolen }
    end

    assert_redirected_to iph_vehicle_path(assigns(:iph_vehicle))
  end

  test "should show iph_vehicle" do
    get :show, id: @iph_vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph_vehicle
    assert_response :success
  end

  test "should update iph_vehicle" do
    put :update, id: @iph_vehicle, iph_vehicle: { brand: @iph_vehicle.brand, color: @iph_vehicle.color, details: @iph_vehicle.details, id: @iph_vehicle.id, line: @iph_vehicle.line, model: @iph_vehicle.model, plate: @iph_vehicle.plate, serial_number: @iph_vehicle.serial_number, stolen: @iph_vehicle.stolen }
    assert_redirected_to iph_vehicle_path(assigns(:iph_vehicle))
  end

  test "should destroy iph_vehicle" do
    assert_difference('IphVehicle.count', -1) do
      delete :destroy, id: @iph_vehicle
    end

    assert_redirected_to iph_vehicles_path
  end
end
