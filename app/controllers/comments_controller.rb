class CommentsController < ApplicationController
  before_action :find_article, only: [:create, :destroy]

  def create
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    @comment.destroy
    redirect_to article_path(@article), notice: "Comment Destroyed Successfully"
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
