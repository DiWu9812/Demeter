require 'uri'
require 'net/http'
require 'openssl'
require 'json'

types = ["main course", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "drink"]
cuisines = ["african", "chinese", "japanese", "korean", "vietnamese", "thai", "indian", "british", "french", "italian","mexican", "spanish", "american", "cajun", "greek", "german"]
tot_resp = Hash.new

types.each do |type|
    puts type
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/searchComplex?limitLicense=false&minCalories=0&maxCalories=1500&offset=0&number=100&cuisine="+URI.encode(type))

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = 'f2e88f0a75msh7aaee86fe618995p1965d7jsn56e197a7a380'
    request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    response = http.request(request)

    resp = JSON.parse(response.read_body)
    if tot_resp.empty?
        tot_resp = resp
    else
        tot_resp["results"] = tot_resp["results"] + resp["results"]
    end
    
end

File.open("rawdata/recipes_id_1111.json","w") do |f|
    f.write(tot_resp.to_json)
end