require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get page_show_url
    assert_response :success
  end

end
