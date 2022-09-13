class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all.page params[:page]
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      ArticleMailer.with(user: current_user).create_mail(@article).deliver_now
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      ArticleMailer.with(user: current_user).update_mail(@article).deliver_now
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    ArticleMailer.with(user: current_user).delete_mail(@article).deliver_now

    redirect_to articles_path, notice: "Article was successfully destroyed."
  end

  private

    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
end
