require "rspec"
require 'spec_helper'

describe "User" do

  it "should login with correct credentials" do
    user = DataProvider.exist_user

    UI::LoginPage::login user
    UI::LoginPage.login_link?.should be_false, "May be user is not logged in, login link is present"
    UI::LoginPage.logout_link?.should be_true, "May be user is not logged in, logout link is present"
  end

  it "should not login with incorrect credentials" do
    user = DataProvider.exist_user
    user.password = DataProvider.rand_string
    UI::LoginPage::login user
    UI::LoginPage::incorrect_credentials_error?.should be_true, "No message about invalid credentials is present"
    UI::LoginPage.logout_link?.should be_false, "May be user is logged in with incorrect password, login link is present"


    UI::LoginPage::login DataProvider.unexist_user
    UI::LoginPage.logout_link?.should be_false, "May be user is logged in with incorrect credentials, login link is present"
  end

end