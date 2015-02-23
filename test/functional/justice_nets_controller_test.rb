require 'test_helper'

class JusticeNetsControllerTest < ActionController::TestCase
  setup do
    @justice_net = justice_nets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:justice_nets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create justice_net" do
    assert_difference('JusticeNet.count') do
      post :create, justice_net: { analyst_id: @justice_net.analyst_id, id: @justice_net.id, justicia_net_folio: @justice_net.justicia_net_folio, observations: @justice_net.observations, received_date: @justice_net.received_date, replied_date: @justice_net.replied_date }
    end

    assert_redirected_to justice_net_path(assigns(:justice_net))
  end

  test "should show justice_net" do
    get :show, id: @justice_net
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @justice_net
    assert_response :success
  end

  test "should update justice_net" do
    put :update, id: @justice_net, justice_net: { analyst_id: @justice_net.analyst_id, id: @justice_net.id, justicia_net_folio: @justice_net.justicia_net_folio, observations: @justice_net.observations, received_date: @justice_net.received_date, replied_date: @justice_net.replied_date }
    assert_redirected_to justice_net_path(assigns(:justice_net))
  end

  test "should destroy justice_net" do
    assert_difference('JusticeNet.count', -1) do
      delete :destroy, id: @justice_net
    end

    assert_redirected_to justice_nets_path
  end
end
