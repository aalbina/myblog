class UsersArticlesController < ApplicationController
  before_action :authenticate_user!

  expose(:articles) { current_user.articles.order(id: :desc) }
  expose(:article, attributes: :article_params)

  def index
    @user = current_user
  end

  def show
  end

  def create
    if article.save
      redirect_to :action => 'show', :id => article.id
    else
      render :new
    end
  end

  def update
    if article.save
      redirect_to users_article_path(article)
    else
      render :edit
    end
  end

  def destroy
    article.destroy

    redirect_to users_articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
