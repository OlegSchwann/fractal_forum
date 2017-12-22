require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get post_main_url
    assert_response :success
  end

end
