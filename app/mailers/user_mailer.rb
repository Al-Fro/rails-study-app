class UserMailer < ApplicationMailer
  def user_activation
    @user = params[:user]
    @encode_id = params[:encode_id]
    
    mail(to: @user.email, subject: 'Please, activate account')
  end
end
