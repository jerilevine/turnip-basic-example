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
    if !page.has_title? Regexp.new(@title)
      raise "Expected to land at #{@title}, got #{page.title} instead."
    end

    return self
  end
end
