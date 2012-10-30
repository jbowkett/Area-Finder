require 'bundler'
require 'scrapi'

puts "hello"
scraper = Scraper.define do
puts "world"
  process "title", :page_name => :text
  result :page_name
end

puts "one"
uri = URI.parse("http://www.bbc.co.uk/news/")
#uri = URI.parse("http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=LOST+third+season&Find.x=17&Find.y=1&Find=Find")
puts "two"
puts scraper.scrape(uri)