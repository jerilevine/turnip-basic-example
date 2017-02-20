Feature: Search

Scenario: Basic Google Search
  Given I am on the Google home page
  When I search for "Selenium WebDriver"
  Then the first search result should be for "Selenium WebDriver"