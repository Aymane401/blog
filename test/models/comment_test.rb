require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without an article" do
    comment = Comment.new(commenter: "John", body: "This is a comment")
    assert_not comment.save, "Saved the comment without an associated article"
end
end
