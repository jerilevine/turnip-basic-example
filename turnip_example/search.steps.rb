require './search_page.rb'
require './results_page.rb'

module SearchSteps
  search_page = nil
  results_page = nil
  
  step "I am on the Google home page" do
    search_page = SearchPage.new.visit_page
  end

  step "I search for :search_term" do | search_term |
    results_page = search_page.search_for(search_term)
  end

  step "the first search result should be for :result" do | result |
    if !results_page.first_result_link.text == result
      raise "Expected first result to equal '#{result}'"
    end

    results_page.save_screenshot "screenshot_#{Time.now.strftime('%Y%m%d%H%M')}.png"
  end
end

RSpec.configure { |c| c.include SearchSteps }
