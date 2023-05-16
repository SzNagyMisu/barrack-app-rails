require "test_helper"

class TrainingSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get training_sessions_index_url
    assert_response :success
  end

  test "should get register" do
    get training_sessions_register_url
    assert_response :success
  end

  test "should get unregister" do
    get training_sessions_unregister_url
    assert_response :success
  end

  test "should get join" do
    get training_sessions_join_url
    assert_response :success
  end
end
