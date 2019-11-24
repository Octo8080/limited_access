require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get application_index_url
    assert_response :success
  end

  test "should get show" do
    get application_show_url
    assert_response :success
  end

end
