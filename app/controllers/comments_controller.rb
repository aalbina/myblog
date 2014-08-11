class CommentsController < ApplicationController

	private 
	    def check_user
	      if (user_signed_in?)
	        redirect_to :users_articles
	      end
	    end
end
