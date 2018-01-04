require 'test_helper'

class UserAccessControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get user_access_login_url
    assert_response :success
  end

  test "should get logout" do
    get user_access_logout_url
    assert_response :success
  end

end
