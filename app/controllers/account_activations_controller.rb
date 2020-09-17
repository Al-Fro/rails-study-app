class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(id: params[:id])

    return redirect_to root_url, flash: { danger: t('flash.invalid_activation_link') } unless user && !user.activated

    user.activate
    log_in user
    redirect_to user, flash: { success: t('flash.account_activated') }
  end
end
