class ArticlesController < ApplicationController
  before_action :set_article, except: [ :index, :new, :create ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @q = Article.ransack(params[:search])
    @articles = @q.result(distinct: true)
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "An article has been created."
    else
      flash[:notice] = "Failed to created an article."
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Successfully updated an article."
    else
      flash[:notice] = "Failed to update an article."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other, notice: "Deleted an article."
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def record_not_found
    redirect_to articles_path, alert: "Record does not exist."
  end
  
  def invalid_foreign_key
    redirect_to @article, alert: "Unable to delete article. Article is still referenced to a comment."
  end
end
