require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test "articles count" do
    Article.create(title: 'title1')
    Article.create(title: 'title2')
    assert_equal 2, Article.count
  end
end