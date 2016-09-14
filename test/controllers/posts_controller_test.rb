require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  setup ​do​
    sign_in users(:one)
    @user = current_user
  end


  test "should get new" do
    get new_post_path
    assert_response :success
  end

  test "should create new post" do
    post posts_path(posts(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_post_path(@user)
    assert_response :success
  end

end
