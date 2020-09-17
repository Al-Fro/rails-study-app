class UserMailerPreview < ActionMailer::Preview
	def user_activation
		@user = User.first

	  UserMailer.with(user: @user).user_activation.deliver_now
	end
end
