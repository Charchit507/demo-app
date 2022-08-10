class CommentsController < ApplicationController
  before_action :comment_create, only: [:create]
  before_action :comment_destroy, only: [:destroy]
  def create
    redirect_to article_path(@article)
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def comment_destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def comment_create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
  end
end
