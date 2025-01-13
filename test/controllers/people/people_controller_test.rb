require "test_helper"

module People
  class PeopleControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include SignInHelper

    setup do
      @person = people_people(:one)
    end

    # test "index: if not signed in it shoudl redirect to sign in" do
    #   get people_url
    #   assert_redirected_to new_user_session_url
    # end

    test "index: if signed in it should get index" do
      sign_in_as users(:one)

      get people_url
      assert_response :success
    end

    # test "show: if not signed in it should redirect to sign in" do
    #   get person_url(@person)
    #   assert_redirected_to new_user_session_url
    # end

    test "show: if owner it should show person" do
      sign_in_as users(:one)

      get person_url(@person)
      assert_response :success
    end

    test "show: if not the owner it should return not found" do
      sign_in_as users(:two)

      get person_url(@person)
      assert_response :not_found
    end

    # test "new: if not signed in it should redirect to sign in" do
    #   get new_person_url
    #   assert_redirected_to new_user_session_url
    # end

    test "new: if signed in it should get new" do
      sign_in_as users(:one)

      get new_person_url
      assert_response :success
    end

    # test "edit: if not signed in it should redirect to sign in" do
    #   get edit_person_url(@person)
    #   assert_redirected_to
    # end

    test "edit: if owner it should get edit" do
      sign_in_as users(:one)

      get edit_person_url(@person)
      assert_response :success
    end

    test "edit: if not the owner it should return not found" do
      sign_in_as users(:two)

      get edit_person_url(@person)
      assert_response :not_found
    end

    # test "create: if not signed in it should redirect to sign in" do
    #   assert_no_difference("Person.count") do
    #     post people_url, params: { person: { last_name: @person.last_name, name: @person.name } }
    #   end

    #   assert_redirected_to new_user_session_url
    # end

    test "create: if signed in it should create person" do
      sign_in_as users(:one)

      assert_difference("Person.count") do
        post people_url, params: { person: { last_name: @person.last_name, name: @person.name } }
      end

      assert_redirected_to person_url(Person.last)
    end

    # test "update: if not signed in it should redirect to sign in" do
    #   patch person_url(@person), params: { person: { last_name: @person.last_name, name: @person.name } }
    #   assert_redirected_to new_user_session_url
    # end

    test "update: if owner and valid data it should update person" do
      sign_in_as users(:one)

      patch person_url(@person), params: { person: { last_name: @person.last_name, name: @person.name } }
      assert_redirected_to person_url(@person)
    end

    test "update: if owner and invalid data it should render edit" do
      sign_in_as users(:one)

      patch person_url(@person), params: { person: { name: nil } }
      assert_response :unprocessable_entity
    end

    test "update: if not the owner it should return not found" do
      sign_in_as users(:two)

      patch person_url(@person), params: { person: { last_name: @person.last_name, name: @person.name } }
      assert_response :not_found
    end

    # test "destroy: if not signed in it should redirect to sign in" do
    #   assert_no_difference("Person.count") do
    #     delete person_url(@person)
    #   end

    #   assert_redirected_to new_user_session_url
    # end

    test "destroy: if owner it should destroy person" do
      sign_in_as users(:one)

      assert_difference("Person.count", -1) do
        delete person_url(@person)
      end

      assert_redirected_to people_url
    end

    test "destroy: if not the owner it should return not found" do
      sign_in_as users(:two)

      assert_no_difference("Person.count") do
        delete person_url(@person)
      end

      assert_response :not_found
    end
  end
end
