class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show]
  load_and_authorize_resource

  def index
    @articles = current_user.articles.page params[:page]
  end

  def show
    @comments = @article.comments
    @comment = Comment.new
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :from, :url, :avatar)
  end
end
