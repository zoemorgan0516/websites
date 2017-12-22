class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_article, only: [:edit, :update, :show]
  layout "admin"

  def index
    @articles = current_user.articles.page params[:page]
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def show
    @comments = @article.comments
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
       redirect_to admin_articles_path
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
       redirect_to admin_articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :from, :url, :avatar)
  end
end
