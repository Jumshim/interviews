# 09/26/2023 Mock w/ Herrick :)

=begin
Take the Github API, hit their GraphQL endpoint, given a user profile, access all people who follow them (followers)

https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api?apiVersion=2022-11-28

Authentication: personal access token

https://docs.github.com/en/rest/overview/resources-in-the-rest-api?apiVersion=2022-11-28
accessed from https://api.github.com
- header "Authorization: Bearer [personal access token]"

https://docs.github.com/en/rest/overview/endpoints-available-for-github-app-user-access-tokens?apiVersion=2022-11-28
// GET /user/followers


=end

require 'net/http' # Documentation: https://github.com/httprb/http/wiki
require 'pry'
# Initialize variables like personal access token + the endpoint
access_token = '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'
endpoint = '/user/followers'
API_URL = 'https://api.github.com'
# Format my HTTP request
uri = URI(API_URL + endpoint)
req = Net::HTTP::Get.new(uri)
req['Authorization'] = "Bearer #{access_token}"
req['Accept'] = "application/vnd.github+json"
req['X-GitHub-Api-Version'] = "2022-11-28"

# Parse the HTTP response to find followers of a user
req = Net::HTTP::Get.new(uri)
req.basic_auth 'user', 'pass'

res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}
puts res.body