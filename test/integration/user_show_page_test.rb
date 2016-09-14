require 'test_helper'


class UserShowPageTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "get to the user show page" do
    sign_in users(:one)
    get user_path(users(:one))
    assert_select "form", count: 1
    assert_select "div.user-info"
    assert_select "div.notifications"
    assert_select "div.timeline"
    assert_select "div.friendship", false , "This page contains no friendship status"
  end
end
