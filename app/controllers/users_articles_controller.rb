class UsersArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@user = current_user.name
    @articles = current_user.articles.order(id: :desc)
  end

  def show
    @article = current_user.articles.find(params[:id])
  end

  def new
    @article = current_user.articles.new
  end

  def create
  	@article = current_user.articles.create(article_params)
 
  	if @article.save
  	  redirect_to :action => 'show', :id => @article.id
  	else
      render 'new'
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to users_articles_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy

    redirect_to users_articles_path    
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end