=begin
Ruby Net::HTTP Class

r
=end
require 'net/http' # include external library
require 'json'
require 'pry'

uri = URI("https://pokeapi.co/api/v2/pokemon/ditto")
# Functions for uri include:
hostname = uri.hostname
path = uri.path
port = uri.port

puts "Hostname: #{hostname}, path: #{path}, port: #{port}"

# Example requests may be written as
# puts JSON.parse(Net::HTTP.get(uri))
Net::HTTP.get(hostname, '/api/v2/pokemon/ditto')
Net::HTTP.start(hostname) do |http|
  http.get('/api/v2/pokemon/ditto')
  http.get('/api/v2/pokemon/squirtle')
end

# Sometimes, you want to make a copy of something without
# changing the original. Im this, we make a duplicate
_uri = uri.dup
_uri.path = '/api/v2/pokemon/squirtle'
# puts JSON.parse(Net::HTTP.get(_uri))

# Sometimes, you want to put in dynamic parameters
uri = URI('http://example.com/index.html')
params = { :limit => 10, :page => 3 }
uri.query = URI.encode_www_form(params)
puts "Encoded url: #{URI.encode_www_form(params)}"

res = Net::HTTP.get_response(uri)
# puts res.body if res.is_a?(Net::HTTPSuccess)

# POST
uri = URI('http://www.example.com/search.cgi')
res = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
# puts res.body

uri = URI('https://engineering.ramp.com/lessons-from-my-internship-at-ramp')
res = Net::HTTP.get_response(uri)
puts res.body.to_s[0..10]
# binding.pry