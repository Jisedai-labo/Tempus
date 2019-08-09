require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test "should be present any contents or languages" do
    @post.language = ""
    assert_not @post.valid?
  end
end
