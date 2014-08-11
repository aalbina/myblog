class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(id: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user.name
  end

end
