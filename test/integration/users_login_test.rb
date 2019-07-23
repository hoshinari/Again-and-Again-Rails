require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    # 2番目のウィンドウでログアウトをクリックするユーザーをシミュレートする
    delete logout_path
    get root_path
    assert flash.empty?
  end
end
