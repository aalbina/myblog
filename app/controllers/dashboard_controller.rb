class DashboardController < ApplicationController
  expose(:articles) { Article.order(id: :desc) }
  expose(:article)

  def index
    @logined = user_signed_in?
  end

  def show
    @logined = user_signed_in?
    @comment = Comment.new
  end
end
