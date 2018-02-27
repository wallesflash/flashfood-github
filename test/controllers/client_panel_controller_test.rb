require 'test_helper'

class ClientPanelControllerTest < ActionDispatch::IntegrationTest
  test "should get my_account" do
    get client_panel_my_account_url
    assert_response :success
  end

  test "should get my_booking" do
    get client_panel_my_booking_url
    assert_response :success
  end

end
