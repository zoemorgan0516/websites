class CommentsController < ApplicationController
  before_action :authenticate_user!
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
  def comment_params
    params.require(:comment).permit(:content)
  end
end
