require 'test_helper'

class IphPeopleControllerTest < ActionController::TestCase
  setup do
    @iph_person = iph_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iph_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iph_person" do
    assert_difference('IphPerson.count') do
      post :create, iph_person: { alias: @iph_person.alias, birth_date: @iph_person.birth_date, ci: @iph_person.ci, first_name: @iph_person.first_name, genre: @iph_person.genre, id: @iph_person.id, last_name1: @iph_person.last_name1, last_name2: @iph_person.last_name2, observations: @iph_person.observations, originative: @iph_person.originative, profession: @iph_person.profession, record: @iph_person.record, status_id: @iph_person.status_id }
    end

    assert_redirected_to iph_person_path(assigns(:iph_person))
  end

  test "should show iph_person" do
    get :show, id: @iph_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iph_person
    assert_response :success
  end

  test "should update iph_person" do
    put :update, id: @iph_person, iph_person: { alias: @iph_person.alias, birth_date: @iph_person.birth_date, ci: @iph_person.ci, first_name: @iph_person.first_name, genre: @iph_person.genre, id: @iph_person.id, last_name1: @iph_person.last_name1, last_name2: @iph_person.last_name2, observations: @iph_person.observations, originative: @iph_person.originative, profession: @iph_person.profession, record: @iph_person.record, status_id: @iph_person.status_id }
    assert_redirected_to iph_person_path(assigns(:iph_person))
  end

  test "should destroy iph_person" do
    assert_difference('IphPerson.count', -1) do
      delete :destroy, id: @iph_person
    end

    assert_redirected_to iph_people_path
  end
end
