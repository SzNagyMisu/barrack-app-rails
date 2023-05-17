require "test_helper"

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_comments_create_url
    assert_response :success
  end
end
