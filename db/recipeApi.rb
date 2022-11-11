require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=200")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'f2e88f0a75msh7aaee86fe618995p1965d7jsn56e197a7a380'
request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

response = http.request(request)

resp = JSON.parse(response.read_body)

File.open("rawdata/recipes_1110.json","w") do |f|
    f.write(resp.to_json)
end