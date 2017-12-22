class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    if @comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
