require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    assert get user_path(users(:one).id)
    assert_response :success
    assert_select "title", "User profile"
  end
end
