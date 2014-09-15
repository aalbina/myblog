class DashboardController < ApplicationController
  expose(:articles) { Article.order(id: :desc) }
  expose(:article)

  def index
  end

  def show
    @comment = Comment.new
  end
end
