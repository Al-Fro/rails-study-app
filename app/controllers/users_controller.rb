class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    return render :new unless @user.save

    @encode_id = Users::ActivationKey.encode(@user.id)
    UserMailer.with(user: @user, encode_id: @encode_id).user_activation.deliver_now
    redirect_to root_url, flash: { success: t('flash.check_email') }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
