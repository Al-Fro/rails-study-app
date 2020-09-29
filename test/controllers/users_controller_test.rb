require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'should get create' do
    attrs = attributes_for(:user)
    post users_path(user: attrs)
    
    user = User.find_by(email: attrs[:email])
    encode_id = Users::ActivationCode.encode(user.id)
    email = UserMailer.with(user: user, encode_id: encode_id).user_activation

    assert_emails 1 do
      email.deliver_later
    end

    assert_response :redirect
    assert user
  end
end
