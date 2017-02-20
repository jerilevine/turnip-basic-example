require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL

Capybara.default_driver = :selenium

visit 'http://www.google.com'
fill_in 'lst-ib', with: 'Selenium WebDriver'
click_button 'Search'
has_link? 'Selenium WebDriver'

save_screenshot 'screenshot.png'
