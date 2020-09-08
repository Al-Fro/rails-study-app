require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get login_path
    assert_response :success
  end

  test 'should get create' do
    params = attributes_for(:user)
    User.create!(params)

    post session_path(session: params.slice(:email, :password))
    assert_response :redirect
  end

  test 'should get destroy' do
    delete session_path
    assert_response :redirect
  end
end
