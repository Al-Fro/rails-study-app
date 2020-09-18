require 'test_helper'

class UsersActivationTest < ActiveSupport::TestCase
  test 'encode/decode' do
    code = Users::ActivationCode.encode('foo')
    assert_equal 'foo', Users::ActivationCode.decode(code) 
  end
end
