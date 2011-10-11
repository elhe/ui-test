module UI
  require 'rubygems'
  require 'singleton'
  require 'settings'
  require 'selenium-webdriver'

  class BrowserRunner
    include Singleton

    def initialize
      @@browser = nil
    end

    def run
      @@browser = Selenium::WebDriver.for Settings::BROWSER
      @@browser.get Settings::BASE_URL
      @@browser
    end

    def stop
      @@browser.quit  if @@browser
      @@browser = nil
    end

    def browser
      @@browser || run
    end

  end


end

def browser
  UI::BrowserRunner.instance.browser
end