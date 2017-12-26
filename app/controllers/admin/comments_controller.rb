class Admin::CommentsController <  BaseController
  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_article_path(@article)
  end
end
