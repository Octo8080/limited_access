require 'test_helper'

class EntryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get entry_index_url
    assert_response :success
  end

  test "should get show" do
    get entry_show_url
    assert_response :success
  end

end
