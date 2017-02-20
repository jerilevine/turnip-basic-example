require 'capybara/dsl'

class BasePage
  include Capybara::DSL

  attr_accessor :url, :title

  def initialize(url='', title='')
    @url = url
    @title = title
  end

  def visit_page
    visit @url
    page.has_title? Regexp.new(@title)

    return self
  end
end
