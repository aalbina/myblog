class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
		
    if @comment.valid?
      @comment.save	
      redirect_to article_path(@article)
    else 
      render 'articles/show'
    end
  end

  def destroy 
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(params[:article_id])
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
