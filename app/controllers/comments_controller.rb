class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)

		if (@comment.valid?)
			@comment.user = current_user
			@comment.save
		else
			# render ''
		end		
	end

	private
    def comment_params
      params.require(:comment).permit(:title, :body)
    end

end
