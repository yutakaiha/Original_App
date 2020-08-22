require 'test_helper'

class SubsidiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subsidies_index_url
    assert_response :success
  end

  test "should get show" do
    get subsidies_show_url
    assert_response :success
  end

end
