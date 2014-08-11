class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(id: :desc)
    @logined = user_signed_in?
  end

  def show
    @article = Article.find(params[:id])
    @logined = user_signed_in?
  end

end
