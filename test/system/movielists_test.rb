require "application_system_test_case"

class MovielistsTest < ApplicationSystemTestCase
  setup do
    @movielist = movielists(:one)
  end

  test "visiting the index" do
    visit movielists_url
    assert_selector "h1", text: "Movielists"
  end

  test "should create movielist" do
    visit movielists_url
    click_on "New movielist"

    fill_in "Description", with: @movielist.description
    fill_in "Title", with: @movielist.title
    click_on "Create Movielist"

    assert_text "Movielist was successfully created"
    click_on "Back"
  end

  test "should update Movielist" do
    visit movielist_url(@movielist)
    click_on "Edit this movielist", match: :first

    fill_in "Description", with: @movielist.description
    fill_in "Title", with: @movielist.title
    click_on "Update Movielist"

    assert_text "Movielist was successfully updated"
    click_on "Back"
  end

  test "should destroy Movielist" do
    visit movielist_url(@movielist)
    click_on "Destroy this movielist", match: :first

    assert_text "Movielist was successfully destroyed"
  end
end
