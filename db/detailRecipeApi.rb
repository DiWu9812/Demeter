require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# types = ["main course", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "drink"]
# cuisines = ["african", "chinese", "japanese", "korean", "vietnamese", "thai", "indian", "british", "french", "italian","mexican", "spanish", "american", "cajun", "greek", "german"]
file = File.read("./rawdata/recipes_id_1111.json")
resp_json = JSON.parse(file)
print "Recipe Number: "
puts resp_json["results"].length()

tot_resp = Hash.new
hash_arr = []
resp_json["results"].each do |recipe|
    recipe_id = recipe["id"].to_s
    recipe_kcal = recipe["calories"]
    puts recipe_id

    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/"+URI.encode(recipe_id)+"/information")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = 'f2e88f0a75msh7aaee86fe618995p1965d7jsn56e197a7a380'
    request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    response = http.request(request)
    resp = JSON.parse(response.read_body)
    resp["calories"] = recipe_kcal

    if tot_resp.empty?
        hash_arr.push(resp)
        tot_resp = {"recipes"=> hash_arr}
    else
        tot_resp["recipes"] = tot_resp["recipes"].append(resp)
    end
end

File.open("rawdata/recipes_1112.json","w") do |f|
    f.write(tot_resp.to_json)
end