module UI
  require 'ui/browser_runner'

  class LoginPage
    LOGIN_LINK = {:link=>"Войти"}
    LOGOUT_LINK = {:link => "Выйти"}
    EMAIL_INPUT_NAME = {:name =>"login[username]"}
    PWD_INPUT_NAME = {:name =>"login[password]"}
    LOGIN_BUTTON_NAME = {:name => "send"}
    INCORRECT_CREDENTIALS_ERROR = {:xpath => "//li[text() = 'Неверный логин или пароль.']"}


    # login as specified user
    def self.login(user)
      browser.find_element(LOGIN_LINK).click

      wait_element EMAIL_INPUT_NAME
      browser.find_element(EMAIL_INPUT_NAME).send_keys user.email
      browser.find_element(PWD_INPUT_NAME).send_keys user.password
      browser.find_element(LOGIN_BUTTON_NAME).click
    end

    # return true when login link is present
    def self.login_link?
      element?(LOGIN_LINK)
    end


    def self.logout_link?
      element?(LOGOUT_LINK)
    end


    def self.incorrect_credentials_error?
      element? INCORRECT_CREDENTIALS_ERROR
    end


    def self.element? criteria
      begin
        browser.find_element criteria
      rescue Selenium::WebDriver::Error::NoSuchElementError
        return false
      end
      return true
    end

    def self.wait_element criteria
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { browser.find_element(criteria) }
    end
  end
end
