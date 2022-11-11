require 'uri'
require 'net/http'
require 'openssl'
require 'json'

def getCal(ingredient)

	url = URI("https://nutritionix-api.p.rapidapi.com/v1_1/search/"+URI.encode(ingredient)+"?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat")

	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	
	request = Net::HTTP::Get.new(url)
	request["X-RapidAPI-Key"] = 'f2e88f0a75msh7aaee86fe618995p1965d7jsn56e197a7a380'
	request["X-RapidAPI-Host"] = 'nutritionix-api.p.rapidapi.com'
	
	response = http.request(request)
	resp = JSON.parse(response.read_body)
    # puts response.read_body

	calorie = 0 #calorie per serving
	resp["hits"].each do |ingre|
		calorie = ingre["fields"]["nf_calories"]
        break
	end

	return calorie
end

getCal("fresh scallops")