require 'test_helper'

class JusticeNetFilesControllerTest < ActionController::TestCase
  setup do
    @justice_net_file = justice_net_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:justice_net_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create justice_net_file" do
    assert_difference('JusticeNetFile.count') do
      post :create, justice_net_file: { id: @justice_net_file.id, justice_net_id: @justice_net_file.justice_net_id, name: @justice_net_file.name }
    end

    assert_redirected_to justice_net_file_path(assigns(:justice_net_file))
  end

  test "should show justice_net_file" do
    get :show, id: @justice_net_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @justice_net_file
    assert_response :success
  end

  test "should update justice_net_file" do
    put :update, id: @justice_net_file, justice_net_file: { id: @justice_net_file.id, justice_net_id: @justice_net_file.justice_net_id, name: @justice_net_file.name }
    assert_redirected_to justice_net_file_path(assigns(:justice_net_file))
  end

  test "should destroy justice_net_file" do
    assert_difference('JusticeNetFile.count', -1) do
      delete :destroy, id: @justice_net_file
    end

    assert_redirected_to justice_net_files_path
  end
end
