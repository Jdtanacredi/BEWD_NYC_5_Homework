require 'rest-client'
require 'json'
require 'pry'


ENV["VERBALIZE_IT_SANDBOX"]

result = RestClient.get('https://sandboxapi.verbalizeit.com/v1/languages.json')

parsed = JSON.parse result

parsed.each do |languages|
  puts "#{languages}"
end

puts "Welcome to Justin's Command Line Translation App"
puts "What language would you like to translate to?"
lang_name = gets.chomp


if result.include?("#{lang_name}") == false
  puts "that is an invalid language"
else
  puts "What would you like translated?"
translate_phrase = gets.chomp
end


parsed.find do |language|
 lang_name == language["name"]
end

#RestClient.post takes 1 argument. Permissions in a hash 
post = RestClient.post('https://sandboxapi.verbalizeit.com/tasks/basic.json', {auth_token: ENV["VERBALIZE_IT_SANDBOX"] ,language: "es", text: "#{translate_phrase}", postback_url: 'http://fake.com' })

parsed_post = JSON.parse post


complete = RestClient.get("https://sandboxapi.verbalizeit.com/tasks/#{parsed_post["id"]}/status.json", {auth_token: ENV["VERBALIZE_IT_SANDBOX"] })

