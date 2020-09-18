class AccountActivationsController < ApplicationController

  def edit
    decoded_id = Users::ActivationCode.decode(params[:encode_id])
    user = User.find_by(id: decoded_id)

    unless user && !user.activated
      return redirect_to root_url, flash: { danger: t('flash.invalid_activation_link') }
    end

    Users::Activate.call(user)
    log_in user
    redirect_to user, flash: { success: t('flash.account_activated') }
  end
end
