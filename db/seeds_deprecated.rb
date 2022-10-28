# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
#     	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
#     	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
#       	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
#       	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
#       	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
#       	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
#       	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
#       	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
#       	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
#   	 ]

# movies.each do |movie|
#   Movie.create!(movie)
# end
require 'json'
require 'uri'
require 'net/http'
require 'openssl'

def getCal(ingredient)
	url = URI("https://api.nal.usda.gov/fdc/v1/foods/search?query="+ingredient+"&dataType=Foundation&pageSize=25&sortBy=dataType.keyword&sortOrder=asc&api_key=MXXHYWJlzta8ZXxFaePEEbCeKUuj2J9PsziEulzU")

	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE

	request = Net::HTTP::Get.new(url)

	response = http.request(request)
	resp = JSON.parse(response.read_body)

	calorie = 0 #calorie per gram
	calorie100 = -1
	resp["foods"].each do |ingre|
		ingre["foodNutrients"].each do |nutri|
			if nutri["nutrientId"] == 1008
				calorie100 = nutri["value"] #calorie per 100 gram
				break
			end
		end
		if calorie100>0
			break
		end
	end
	if calorie100>0
		calorie = calorie100/10.0
	end

	return calorie
end

file = File.read("#{Rails.root}/db/rawdata/recipes.json")
resp_json = JSON.parse(file)
print "Recipe Number: "
puts resp_json["recipes"].length()

processed_recipe = 0

resp_json["recipes"].each do |recipe|
	processed_recipe += 1
	if processed_recipe%10 == 0
		puts "Processing the #{processed_recipe}th recipe"
	end
	recipe_entry = {:name => recipe["title"], :steps => recipe["instructions"], :image_url => recipe["image"]}
	recipe_row = Recipe.create!(recipe_entry)
	
	recipe_id = recipe_row.id
	recipe["extendedIngredients"].each do |ingredient|
		name = ingredient["nameClean"]
		if !name
			next
		end 
		ingredient_id = -1
		
		if !Ingredient.where(name: name).first
			calorie = getCal(name)
			ingredient_entry = {:name => name, :calorie_per_gram => calorie}
			ingredient_row = Ingredient.create!(ingredient_entry)
		end
		
		ingredient_id = Ingredient.where(name: name).first.id
		amount = ingredient["amount"]
		unit = ingredient["unit"]
		metric_amount = ingredient["measures"]["metric"]["amount"]
		metric_unit = ingredient["measures"]["metric"]["unitShort"]

		reci_ingre_entry = {:unit => unit, :amount => amount, :recipe_id => recipe_id, :ingredient_id => ingredient_id, :metric_amount => metric_amount, :metric_unit => metric_unit}
		RecipeIngredient.create!(reci_ingre_entry)
	end
end