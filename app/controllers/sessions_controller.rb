class SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])

    unless user&.authenticate(session_params[:password])
      flash.now[:danger] = t('flash.invalid_email_or_password')
      render :new
      return
    end

    return redirect_to root_url, flash: { danger: t('flash.account_not_activated') } unless user.activated?

    log_in user
    redirect_to user
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
