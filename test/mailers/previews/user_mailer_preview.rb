class UserMailerPreview < ActionMailer::Preview
  def user_activation
    UserMailer.with(user: User.first).user_activation.deliver_now
  end
end
