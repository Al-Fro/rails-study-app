require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'user_activation' do
    user = create(:user)
    encode_id = Users::ActivationKey.encode(user.id)

    email = UserMailer.with(user: user, encode_id: encode_id).user_activation

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@example.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Please, activate account', email.subject
    assert email.body.to_s.include?("registration_token=#{encode_id}")
  end
end
