require "test_helper"

class EmployeeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_index_url
    assert_response :success
  end

  test "should get dashboard" do
    get employee_dashboard_url
    assert_response :success
  end
end
