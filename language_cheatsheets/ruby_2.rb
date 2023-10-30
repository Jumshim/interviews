require 'http'
require 'json'
require 'pry'

puts "-----HTTP REQUESTS-----"
endpoint = "activity"
response = HTTP.get("https://www.boredapi.com/api/" + endpoint)
# binding.pry
# // binding.pry invokes a Pry session in the middle of a running program
# // Makes all program state at that point available!
# printing the HTTP response converts it into a JSON object
# We need to parse the JSON object to make it into a hash-like structure!
# pp response # << This is just the HTTP response
# puts "response code: #{response.code}"

parsed = response.parse
# pp parsed

# if we want the data, we need to parse responses to get access to their body
# HTTP Response Status Codes
# 200 - OK
# 201 - Created
# 202 - Accepted

puts "-----WEBSCRAPING-----"
scraped_page = HTTP.get("https://en.wikipedia.org/wiki/Web_scraping").to_s.split('href=')
links = []
scraped_page.each do |section|
  if /https:\/\/(?<link>.*[.com]?[.org]?.*)"/ =~ section
    links.push(link)
  end
end
# puts links
# binding.pry