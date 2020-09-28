require 'test_helper'

class UsersActivationTest < ActiveSupport::TestCase
  test 'encode/decode' do
    key = 'key'
    value = 'value'

    code = JwtService.encode(key, value)
    assert_equal value, JwtService.decode(key, code)
  end
end
