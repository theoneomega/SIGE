require 'test_helper'

class IphsControllerTest < ActionController::TestCase
  setup do
    @iph = iphs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iphs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph" do
    assert_difference('Iph.count') do
      post :create, iph: { address: @iph.address, description: @iph.description, folio: @iph.folio, id: @iph.id, iph_date: @iph.iph_date, locality_id: @iph.locality_id, observations: @iph.observations, office_number: @iph.office_number, priority_id: @iph.priority_id, searchable: @iph.searchable, state_id: @iph.state_id, suburb: @iph.suburb, tramo_carretero: @iph.tramo_carretero, user_id: @iph.user_id }
    end

    assert_redirected_to iph_path(assigns(:iph))
  end

  test "should show iph" do
    get :show, id: @iph
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph
    assert_response :success
  end

  test "should update iph" do
    put :update, id: @iph, iph: { address: @iph.address, description: @iph.description, folio: @iph.folio, id: @iph.id, iph_date: @iph.iph_date, locality_id: @iph.locality_id, observations: @iph.observations, office_number: @iph.office_number, priority_id: @iph.priority_id, searchable: @iph.searchable, state_id: @iph.state_id, suburb: @iph.suburb, tramo_carretero: @iph.tramo_carretero, user_id: @iph.user_id }
    assert_redirected_to iph_path(assigns(:iph))
  end

  test "should destroy iph" do
    assert_difference('Iph.count', -1) do
      delete :destroy, id: @iph
    end

    assert_redirected_to iphs_path
  end
end
