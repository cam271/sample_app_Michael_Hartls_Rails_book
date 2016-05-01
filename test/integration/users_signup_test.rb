require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, user: { name:  "Example User",
                               email: "user@example.com",
                               password:              "foobar",
                               password_confirmation: "foobar" }
		end
    assert_template 'users/show'
  	assert is_logged_in?
	end
end
