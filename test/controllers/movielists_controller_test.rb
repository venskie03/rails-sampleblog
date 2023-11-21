require "test_helper"

class MovielistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movielist = movielists(:one)
  end

  test "should get index" do
    get movielists_url
    assert_response :success
  end

  test "should get new" do
    get new_movielist_url
    assert_response :success
  end

  test "should create movielist" do
    assert_difference("Movielist.count") do
      post movielists_url, params: { movielist: { description: @movielist.description, title: @movielist.title } }
    end

    assert_redirected_to movielist_url(Movielist.last)
  end

  test "should show movielist" do
    get movielist_url(@movielist)
    assert_response :success
  end

  test "should get edit" do
    get edit_movielist_url(@movielist)
    assert_response :success
  end

  test "should update movielist" do
    patch movielist_url(@movielist), params: { movielist: { description: @movielist.description, title: @movielist.title } }
    assert_redirected_to movielist_url(@movielist)
  end

  test "should destroy movielist" do
    assert_difference("Movielist.count", -1) do
      delete movielist_url(@movielist)
    end

    assert_redirected_to movielists_url
  end
end
