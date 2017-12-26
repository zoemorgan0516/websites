class Admin::ArticlesController < BaseController
  before_action :set_article, only: [:edit, :update, :show]

  def index
    @articles = @site.articles.page params[:page]
  end

  def new
    @article = @site.articles.new
  end

  def edit
  end

  def show
    @comments = @article.comments
  end

  def create
    @article = @site.articles.new(article_params)
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
