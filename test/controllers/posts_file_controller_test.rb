require "test_helper"

class PostsFileControllerTest < ActionDispatch::IntegrationTest
  test "should get file:attachment" do
    get posts_file_file:attachment_url
    assert_response :success
  end
end
