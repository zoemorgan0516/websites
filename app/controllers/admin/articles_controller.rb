class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_article, only: [:edit, :update, :show]
  layout "admin"

  def index
    @site = current_user.site
    @articles = @site.articles.page params[:page]
  end

  def new
    @site = current_user.site
    @article = @site.articles.new
  end

  def edit
    @site = current_user.site
  end

  def show
    @site = current_user.site
    @comments = @article.comments
  end

  def create
    @site = current_user.site
    @article = @site.articles.new(article_params)
    if @article.save
       redirect_to admin_articles_path
    else
      render :new
    end
  end

  def update
    @site = current_user.site
    if @article.update(article_params)
       redirect_to admin_articles_path
    else
      render :edit
    end
  end

  def destroy
    @site = current_user.site
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
