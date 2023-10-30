require 'net/http'
require 'json'
require 'async'
require 'async/http/internet'

uri = URI('https://api.github.com/user/followers')

req = Net::HTTP::Get.new(uri)
req['Authorization'] = "Bearer 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"
req['Accept'] = "application/vnd.github+json"
req['X-GitHub-Api-Version'] = "2022-11-28"

res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
  http.request(req)
}
puts JSON.parse(res.body)

# Given a user, find their followers
def find_followers(access_token)
  uri = URI('https://api.github.com/user/followers')

  req = Net::HTTP::Get.new(uri)
  req['Authorization'] = "Bearer #{access_token}"
  req['Accept'] = "application/vnd.github+json"
  req['X-GitHub-Api-Version'] = "2022-11-28"

  res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
    http.request(req)
  }
  JSON.parse(res.body)
end
# For each of their followers, recursively find their followers
# get a followers list
# for each follower, go to their following_url
# get the count of the following url
# if the count is > than an ongoing_count, replace ongoing_count and set that person as the new king

def find_most_popular_follower(followers, access_token)
  max_followers = 0
  popular_name = ''
  followers_list = []
  visited = {}
  # IO bound vs CPU bound
    # waiting on Database / Network requests
    # holding the thread until it actually parses
    # 1 request at a time

  followers.each do |follower|
    followers_list.prepend(follower)
  end

  until followers_list.empty?
    follower = followers_list.pop
    if visited[follower["login"]]
      next
    else
      visited[follower["login"]] = true
    end
    # get follower url
    followers_url = follower["followers_url"]

    # setup request and response
    uri = URI("#{followers_url}")
    puts followers_url
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{access_token}"
    req['Accept'] = "application/vnd.github+json"
    req['X-GitHub-Api-Version'] = "2022-11-28"
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
      http.request(req)
    }

    # get response
    parsed_response = JSON.parse(res.body) # all of their followers
    parsed_response.each do |item|
      followers_list.prepend(item)
    end

    follower_count = parsed_response.length
    if follower_count > max_followers
      popular_name = follower["login"]
      max_followers = follower_count
    end

    # append all followers to a list
  end
  return max_followers, popular_name
end

# Return the count of the follower with the most followers and the name

access_token = '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'
puts find_most_popular_follower(find_followers(access_token), access_token)