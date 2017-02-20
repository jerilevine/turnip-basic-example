require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL

Capybara.default_driver = :selenium

visit 'http://www.google.com'
fill_in 'lst-ib', with: 'Selenium WebDriver'
click_button 'Search'
page.has_title? 'Google Search'
first_link = first('h3 a')

if !first_link.text == 'Selenium WebDriver'
  raise "Expected first result to equal 'Selenium WebDriver'"
end

save_screenshot "screenshot_#{Time.now.strftime('%Y%m%d%H%M')}.png"
