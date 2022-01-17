class UserMailer < ApplicationMailer
	def notify_user(user)
		@user = user
		@authors = User.all
		@authors.each do |auth|
			if auth.id == @user
				mail(to: auth.email, subject: "Assignment of your book")
			end
		end

		
	end
end
