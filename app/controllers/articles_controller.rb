class ArticlesController < FrontBaseController
  before_action :set_article, only: [:show]

  def index
    @articles = @current_site.articles.page params[:page]
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
