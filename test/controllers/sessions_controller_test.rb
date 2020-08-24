require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get login_path
    assert_response :success
  end

  test 'should get create' do
    user = create(:user)
    attrs = {
      email: user.email,
      password: user.password
    }

    post session_path, params: { session: attrs }
    assert_response :redirect
  end

  test 'should get destroy' do
    delete session_path
    assert_response :redirect
  end
end
