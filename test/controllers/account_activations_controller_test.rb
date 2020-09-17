require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    user = create(:user)

    get edit_account_activation_url(user)

    assert_response :redirect
    assert User.find(user.id).activated?
  end
end
