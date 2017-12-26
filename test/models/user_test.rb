require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Логин уникален' do
    user1 = User.new
    user1.login = 'Test'
    user1.password_hash = '0'
    assert user.save
    user2 = User.new
    user2.login = 'Test'
    user2.password_hash = '0'
    assert user2.save == FALSE
    user1.destroy!
  end
end
