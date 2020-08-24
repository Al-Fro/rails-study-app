require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should get new' do
    get new_session_path
    assert_response :success
  end

  test 'should get create' do
    post session_path, params: { session: { email: @user.email, password: 'secret' } }
    assert_response :redirect
  end
end
