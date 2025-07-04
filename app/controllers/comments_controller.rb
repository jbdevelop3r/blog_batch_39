class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_article_comment, only: [ :show, :edit ]

  def index
    @comments = @article.comments
  end

  def show; end

  def edit; end

  
  
  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
  
  def set_article
    @article = Article.find(params[:article_id])
  end
  
  def set_article_comment
    @comment = @article.comments.find(params[:id])
  end
end
