require_relative 'translate'
require 'rest-client'
require 'json'
require 'pry'


ENV["VERBALIZE_IT_SANDBOX"]

api_result = RestClient.get('https://sandboxapi.verbalizeit.com/v1/languages.json', {auth_token: ENV["VERBALIZE_IT_SANDBOX"]})

parsed = JSON.parse api_result

parsed.each do |languages|
  puts "#{languages}"
end

d = Translate.new api_result, @lang_name, @translate_phrase

d.what_language?

d.translate_me

language_code = parsed.find { |l| l["name"] == d.lang_name}["language_code"]

#RestClient.post takes 1 argument. Permissions in a hash 
post = RestClient.post('https://sandboxapi.verbalizeit.com/tasks/basic.json', {auth_token: ENV["VERBALIZE_IT_SANDBOX"] ,language: language_code, text: "#{@translate_phrase}", postback_url: 'http://fake.com' })

parsed_post = JSON.parse post
puts "Once I learn rails I can use this id number to get your translation: #{parsed_post["id"].to_i}"

complete = RestClient.get("https://sandboxapi.verbalizeit.com/tasks/#{parsed_post["id"].to_i}/status.json?auth_token=#{ENV["VERBALIZE_IT_SANDBOX"]}")

puts complete
