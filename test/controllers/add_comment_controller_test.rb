require 'test_helper'

class AddCommentControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get add_comment_add_url
    assert_response :success
  end

end
