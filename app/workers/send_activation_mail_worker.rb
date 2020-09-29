class SendActivationMailWorker
  include Sidekiq::Worker

  def perform(user_id, encode_id)
    user = User.find(user_id)

    UserMailer.with(user: user, encode_id: encode_id).user_activation.deliver_now
  end
end
