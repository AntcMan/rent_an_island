require "test_helper"

class IslandsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get islands_new_url
    assert_response :success
  end

  test "should get edit" do
    get islands_edit_url
    assert_response :success
  end

  test "should get show" do
    get islands_show_url
    assert_response :success
  end
end
