require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    user = create(:user)
    encode_id = Users::ActivationKey.encode(user.id)

    get edit_account_activation_path(user, registration_token: encode_id)

    assert_response :redirect
    assert User.find(user.id).activated?
  end
end
