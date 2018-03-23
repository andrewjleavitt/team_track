require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  test "accessing when not logged in redirects to login" do
    Authentication.stub(:authenticated?, false) do
      get root_path
      assert_redirected_to login_path
    end
  end
end
