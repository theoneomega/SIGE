require 'test_helper'

class IphCrimesControllerTest < ActionController::TestCase
  setup do
    @iph_crime = iph_crimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iph_crimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph_crime" do
    assert_difference('IphCrime.count') do
      post :create, iph_crime: { concept: @iph_crime.concept, id: @iph_crime.id }
    end

    assert_redirected_to iph_crime_path(assigns(:iph_crime))
  end

  test "should show iph_crime" do
    get :show, id: @iph_crime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph_crime
    assert_response :success
  end

  test "should update iph_crime" do
    put :update, id: @iph_crime, iph_crime: { concept: @iph_crime.concept, id: @iph_crime.id }
    assert_redirected_to iph_crime_path(assigns(:iph_crime))
  end

  test "should destroy iph_crime" do
    assert_difference('IphCrime.count', -1) do
      delete :destroy, id: @iph_crime
    end

    assert_redirected_to iph_crimes_path
  end
end
