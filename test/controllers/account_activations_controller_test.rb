require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    user = create(:user)
    encode_id = Users::ActivationCode.encode(user.id)

    get edit_account_activation_url(user, encode_id: encode_id)

    assert_response :redirect
    assert User.find(user.id).activated?
  end
end
