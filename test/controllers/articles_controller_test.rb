require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_path

    assert_response :success
  end

  test "should get mew" do
    get new_article_path

    assert_response :success
  end

  test "should create an article with valid params" do
    post articles_path, params: { article: { title: "test title", body: "test body" } }

    assert_response :redirect
  end
end
