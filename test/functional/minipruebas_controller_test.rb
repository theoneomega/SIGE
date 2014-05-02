require 'test_helper'

class MinipruebasControllerTest < ActionController::TestCase
  setup do
    @miniprueba = minipruebas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:minipruebas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create miniprueba" do
    assert_difference('Miniprueba.count') do
      post :create, miniprueba: { id: @miniprueba.id }
    end

    assert_redirected_to miniprueba_path(assigns(:miniprueba))
  end

  test "should show miniprueba" do
    get :show, id: @miniprueba
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miniprueba
    assert_response :success
  end

  test "should update miniprueba" do
    put :update, id: @miniprueba, miniprueba: { id: @miniprueba.id }
    assert_redirected_to miniprueba_path(assigns(:miniprueba))
  end

  test "should destroy miniprueba" do
    assert_difference('Miniprueba.count', -1) do
      delete :destroy, id: @miniprueba
    end

    assert_redirected_to minipruebas_path
  end
end
