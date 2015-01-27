# encoding: UTF-8

# Faraday is a simple, but flexible HTTP client library, with support for
# multiple backends. We will use it here to read the server's response 
# that we want to verify.
require 'faraday'
# We use the Socket library to find out the IP of the server in order to
# form the url to test.
require 'socket'

Given(/^the url of Wonderstuff's home page$/) do       
  @local_ip = Socket.ip_address_list[2].ip_address
  @url = "http://#{@local_ip}:80"
end       
       
When(/^a web user browses to the URL$/) do       
 connection = Faraday.new(:url => @url) do |faraday|
    faraday.adapter Faraday.default_adapter
  end
  @response = connection.get('/')
end       
       
Then(/^the connection should be successful$/) do       
  expect(@response.success?).to eq(true)
end       
       
Then(/^the page status should be OK$/) do       
  expect(@response.status).to eq(200)
end
       
Then(/^the user should see "(.*?)"$/) do |arg1|
  expect(@response.body).to match(arg1)
end
