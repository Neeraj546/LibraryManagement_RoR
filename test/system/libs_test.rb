require "application_system_test_case"

class LibsTest < ApplicationSystemTestCase
  setup do
    @lib = libs(:one)
  end

  test "visiting the index" do
    visit libs_url
    assert_selector "h1", text: "Libs"
  end

  test "should create lib" do
    visit libs_url
    click_on "New lib"

    fill_in "Closing time", with: @lib.closing_time
    fill_in "Name", with: @lib.name
    fill_in "Opening time", with: @lib.opening_time
    click_on "Create Lib"

    assert_text "Lib was successfully created"
    click_on "Back"
  end

  test "should update Lib" do
    visit lib_url(@lib)
    click_on "Edit this lib", match: :first

    fill_in "Closing time", with: @lib.closing_time
    fill_in "Name", with: @lib.name
    fill_in "Opening time", with: @lib.opening_time
    click_on "Update Lib"

    assert_text "Lib was successfully updated"
    click_on "Back"
  end

  test "should destroy Lib" do
    visit lib_url(@lib)
    click_on "Destroy this lib", match: :first

    assert_text "Lib was successfully destroyed"
  end
end
