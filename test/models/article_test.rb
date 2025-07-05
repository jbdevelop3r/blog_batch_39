require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save an article without a title" do
    article = Article.new(body: "test body")
    assert_not article.save
  end

  test "should not save an article without a body" do
    article = Article.new(title: "test title")
    assert_not article.save
  end

  test "should not save an article with < 5 chars" do
    article = Article.new(title: "test title", body: "test")
    assert_not article.save
  end

  test "should save an article with valid params" do
    article = Article.new(title: "test title", body: "test body")
    assert article.save
  end
end
