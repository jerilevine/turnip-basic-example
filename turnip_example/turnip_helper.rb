require 'turnip/capybara'
require 'capybara'
require 'selenium-webdriver'
require 'fileutils'

Dir.glob("./*.steps.rb") { |f| load f, true }

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  
  config.before(:suite) do
    Capybara.run_server = false

    Capybara.default_driver = :selenium

    Capybara.current_session.driver.browser.manage.window.maximize
    Capybara.default_max_wait_time = 5   # seconds

  end
end
