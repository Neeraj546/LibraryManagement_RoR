require "test_helper"

class LibsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lib = libs(:one)
  end

  test "should get index" do
    get libs_url
    assert_response :success
  end

  test "should get new" do
    get new_lib_url
    assert_response :success
  end

  test "should create lib" do
    assert_difference("Lib.count") do
      post libs_url, params: { lib: { closing_time: @lib.closing_time, name: @lib.name, opening_time: @lib.opening_time } }
    end

    assert_redirected_to lib_url(Lib.last)
  end

  test "should show lib" do
    get lib_url(@lib)
    assert_response :success
  end

  test "should get edit" do
    get edit_lib_url(@lib)
    assert_response :success
  end

  test "should update lib" do
    patch lib_url(@lib), params: { lib: { closing_time: @lib.closing_time, name: @lib.name, opening_time: @lib.opening_time } }
    assert_redirected_to lib_url(@lib)
  end

  test "should destroy lib" do
    assert_difference("Lib.count", -1) do
      delete lib_url(@lib)
    end

    assert_redirected_to libs_url
  end
end
