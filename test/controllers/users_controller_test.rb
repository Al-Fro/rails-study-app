require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'should get create' do
    attrs = attributes_for(:user)
    post users_path, params: { user: attrs }

    assert_response :redirect
    assert User.find_by(email: attrs[:email])
  end
end
