require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:one)
  end

  test "should be logged in" do
    post posts_path, params:{content: "a", language: "b", user_id: 0}
    assert_redirected_to posts_url
  end
end
