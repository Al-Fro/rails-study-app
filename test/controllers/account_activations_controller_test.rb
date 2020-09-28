require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    user = create(:user)
    encode_id = JwtService.encode('activation_key', user.id)

    get account_activations_path(activation_token: encode_id)

    assert_response :redirect
    assert User.find(user.id).activated?
  end
end
