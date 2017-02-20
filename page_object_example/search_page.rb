require './base_page.rb'

class SearchPage < BasePage
  def initialize
    super('http://www.google.com', 'Google')
  end

  def search_box
    find('input#lst-ib')
  end

  def search_button
    find_button('Search')
  end

  def search_for(term)
    search_box.set(term)
    search_button.click

    return ResultsPage.new(term)
  end
end
