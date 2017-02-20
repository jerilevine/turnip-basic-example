require 'capybara'
require 'selenium-webdriver'
require './search_page.rb'
require './results_page.rb'

Capybara.default_driver = :selenium

search_page = SearchPage.new.visit_page
results_page = search_page.search_for('Selenium WebDriver')

if !results_page.first_result_link.text == 'Selenium WebDriver'
  raise "Expected first result to equal 'Selenium WebDriver'"
end

results_page.save_screenshot "screenshot_#{Time.now.strftime('%Y%m%d%H%M')}.png"
