class AccountActivationsController < ApplicationController
  def edit
    decoded_id = Users::ActivationKey.decode(params[:registration_token])
    user = User.find_by(id: decoded_id)

    return redirect_to root_url, flash: { danger: t('flash.invalid_activation_link') } unless user&.activated.nil?

    Users::Activate.call(user)
    log_in user
    redirect_to user, flash: { success: t('flash.account_activated') }
  end
end
