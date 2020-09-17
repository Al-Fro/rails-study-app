class UserMailer < ApplicationMailer
  def user_activation
    @user = params[:user]

    mail(to: @user.email, subject: 'Please, activate account')
  end
end
