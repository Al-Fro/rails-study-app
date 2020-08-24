require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'should get create' do
    post users_path, params: { user: { name: @user.name,  
                                       email: @user.email, 
                                       password: 'secret', 
                                       password_confirmation: 'secret' } }
    assert_response :redirect
  end
end
