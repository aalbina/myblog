class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose(:article)
  expose(:comments, ancestor: :article)
  expose(:comment, attributes: :comment_params)

  def create
    comment.user_id = current_user.id

    if comment.valid?
      comment.save
      redirect_to article
    else
      render 'articles/show'
    end
  end

  def destroy
    self.comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
