require 'test_helper'

class ColaborationFilesControllerTest < ActionController::TestCase
  setup do
    @colaboration_file = colaboration_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colaboration_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colaboration_file" do
    assert_difference('ColaborationFile.count') do
      post :create, colaboration_file: { colaboration_id: @colaboration_file.colaboration_id, description: @colaboration_file.description, file: @colaboration_file.file, id: @colaboration_file.id }
    end

    assert_redirected_to colaboration_file_path(assigns(:colaboration_file))
  end

  test "should show colaboration_file" do
    get :show, id: @colaboration_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colaboration_file
    assert_response :success
  end

  test "should update colaboration_file" do
    put :update, id: @colaboration_file, colaboration_file: { colaboration_id: @colaboration_file.colaboration_id, description: @colaboration_file.description, file: @colaboration_file.file, id: @colaboration_file.id }
    assert_redirected_to colaboration_file_path(assigns(:colaboration_file))
  end

  test "should destroy colaboration_file" do
    assert_difference('ColaborationFile.count', -1) do
      delete :destroy, id: @colaboration_file
    end

    assert_redirected_to colaboration_files_path
  end
end
