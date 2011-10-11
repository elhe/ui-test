require 'ui/login_page'
require 'dp/data_provider'

RSpec.configure do |config|
  config.after(:each) do
    UI::BrowserRunner.instance.stop
  end
end