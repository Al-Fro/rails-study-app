class UserMailer < ApplicationMailer
  def user_activation
    @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Please, activate account')
  end
end
