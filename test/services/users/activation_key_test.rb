require 'test_helper'

class UsersActivationTest < ActiveSupport::TestCase
  test 'encode/decode' do
    code = Users::ActivationKey.encode('foo')
    assert_equal 'foo', Users::ActivationKey.decode(code)
  end
end
