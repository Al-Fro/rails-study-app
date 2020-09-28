class AccountActivationsController < ApplicationController
  def index
    decoded_id = JwtService.decode('activation_key', params[:activation_token])
    user = User.find_by(id: decoded_id)

    return redirect_to root_url, flash: { danger: t('flash.invalid_activation_link') } if user&.activated
    return redirect_to root_url, flash: { danger: t('flash.error_update_user') } unless Users::Activate.call(user)
    
    log_in user
    redirect_to user, flash: { success: t('flash.account_activated') }
  end
end
