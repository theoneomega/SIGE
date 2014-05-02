require 'test_helper'

class IphDrugsControllerTest < ActionController::TestCase
  setup do
    @iph_drug = iph_drugs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iph_drugs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph_drug" do
    assert_difference('IphDrug.count') do
      post :create, iph_drug: { id: @iph_drug.id, kind: @iph_drug.kind, observations: @iph_drug.observations, quantity: @iph_drug.quantity }
    end

    assert_redirected_to iph_drug_path(assigns(:iph_drug))
  end

  test "should show iph_drug" do
    get :show, id: @iph_drug
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph_drug
    assert_response :success
  end

  test "should update iph_drug" do
    put :update, id: @iph_drug, iph_drug: { id: @iph_drug.id, kind: @iph_drug.kind, observations: @iph_drug.observations, quantity: @iph_drug.quantity }
    assert_redirected_to iph_drug_path(assigns(:iph_drug))
  end

  test "should destroy iph_drug" do
    assert_difference('IphDrug.count', -1) do
      delete :destroy, id: @iph_drug
    end

    assert_redirected_to iph_drugs_path
  end
end
