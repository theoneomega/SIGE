require 'test_helper'

class IphWeaponsControllerTest < ActionController::TestCase
  setup do
    @iph_weapon = iph_weapons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iph_weapons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph_weapon" do
    assert_difference('IphWeapon.count') do
      post :create, iph_weapon: { brand: @iph_weapon.brand, caliber: @iph_weapon.caliber, id: @iph_weapon.id, model: @iph_weapon.model, serial_number: @iph_weapon.serial_number, weapon: @iph_weapon.weapon, weapon_type_id: @iph_weapon.weapon_type_id }
    end

    assert_redirected_to iph_weapon_path(assigns(:iph_weapon))
  end

  test "should show iph_weapon" do
    get :show, id: @iph_weapon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph_weapon
    assert_response :success
  end

  test "should update iph_weapon" do
    put :update, id: @iph_weapon, iph_weapon: { brand: @iph_weapon.brand, caliber: @iph_weapon.caliber, id: @iph_weapon.id, model: @iph_weapon.model, serial_number: @iph_weapon.serial_number, weapon: @iph_weapon.weapon, weapon_type_id: @iph_weapon.weapon_type_id }
    assert_redirected_to iph_weapon_path(assigns(:iph_weapon))
  end

  test "should destroy iph_weapon" do
    assert_difference('IphWeapon.count', -1) do
      delete :destroy, id: @iph_weapon
    end

    assert_redirected_to iph_weapons_path
  end
end
