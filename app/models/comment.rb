class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :article
	validates :title, :body, presence: true, length: { minimum: 5 }
	validates user_logined

	def user_logined
	  if user_signed_in?
        errors.add(:user, "you should login before leave comments")
      end
	end 
end
