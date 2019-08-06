class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id].to_i)
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_strong_params)
    redirect_to article_path(article)
  end

  def edit
    @article = Article.find(params[:id].to_i)
  end

  def update
    @article = Article.find(params[:id].to_i)
    @article.update(article_strong_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id].to_i)
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_strong_params
    params.require(:article).permit(:title, :content, :created_at, :updated_at)
  end
end
