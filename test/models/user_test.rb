require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "#full_name returns the capitalized first name and last name" do
    user = User.new(first_name: "john", last_name: "lennon")
    assert_equal "John Lennon", user.full_name
    second_user = User.new(first_name: "bertrand", last_name: "russell")
    assert_equal "Bertrand Russell", second_user.full_name

  end
end
