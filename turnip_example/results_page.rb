require './base_page.rb'
require 'uri'

class ResultsPage < BasePage
  def initialize(search_term)
    enc_uri = URI.escape("https://www.google.com/\#q=#{search_term}")
    super(enc_uri, 'Google Search')
  end
  
  def first_result_link
    page.has_title? 'Google Search'
    first('h3 a')
  end
end
