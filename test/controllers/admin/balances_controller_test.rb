require "test_helper"

class Admin::BalancesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_balances_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_balances_update_url
    assert_response :success
  end
end
