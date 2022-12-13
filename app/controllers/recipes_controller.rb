require 'uri'
require 'json'
require 'net/http'
require 'openssl'

def trim(num)
  i, f = num.to_i, num.to_f
  i == f ? i : f
end

$pageSize = 12
$customImg = "https://www.linkpicture.com/q/placeholder_user.jpg"

def getCal(ing)
  url = URI("https://nutritionix-api.p.rapidapi.com/v1_1/search/"+URI.encode(ing)+"?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat")
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

class RecipesController < ApplicationController

  def show
    @recipe = Recipe.joins(:recipe_ingredients, :ingredients).find(params[:id])
    # @recipe.ingredients.includes( :recipe_ingredients )
    @ingredients = @recipe.ingredients
    amounts = Hash.new
    @recipe.recipe_ingredients.each do |amount|
      amounts[amount.ingredient_id] = amount
    end
    @ingredients = @recipe.ingredients.map { |ingredient| {
      "name" => ingredient.name,
      "amount" => trim(amounts[ingredient.id].amount),
      "metric_unit" => amounts[ingredient.id].metric_unit,
    } }
    puts('haha')
    puts(@ingredients.inspect)
  end

  def index
    redirect_to "/recipes/page/1"
  end

  def page
    session[:return_to] = request.original_url
    pageId = params['id'].to_i
    @recipes = Recipe.offset((pageId - 1) * $pageSize).limit($pageSize)

    @user = valid_user
    @favorited = true
    if @user
      @recipes.each do |recipe|
        recipe.favorited = SavedRecipe.where(user_id: valid_user.id, recipe_id: recipe.id).count > 0
      end
    end
    count = Recipe.all.count

    pageCount = count % $pageSize == 0 ? count / $pageSize : (count / $pageSize) + 1

    @summary = "Page #{pageId} of #{pageCount} for all recipes"

    pageSet = Set[]
    pageSet.add(1)
    if 2 <= pageCount
      pageSet.add(2)
    end
    if 1 <= pageId - 1
      pageSet.add(pageId - 1)
    end
    pageSet.add(pageId)
    if pageId + 1 <= pageCount
      pageSet.add(pageId + 1)
    end
    if pageCount - 1 >= 1
      pageSet.add(pageCount - 1)
    end
    pageSet.add(pageCount)

    @pages = []
    @pages.append({
      "text" => "Previous",
      "link" => pageId == 1 ? nil : "/recipes/page/#{pageId - 1}",
      "disabled" => pageId == 1
    })

    pageArray = pageSet.to_a.sort
    for index in 0 ... pageArray.size
      @pages.append({
        "text" => "#{pageArray[index]}",
        "link" => "/recipes/page/#{pageArray[index]}",
        "active" => pageId == pageArray[index]
      })
      if index != pageArray.size - 1 and pageArray[index] + 1 < pageArray[index + 1]
        @pages.append({
          "text" => "...",
          "disabled" => true
        })
      end
    end

    @pages.append({
      "text" => "Next",
      "link" => pageId == pageCount ? nil : "/recipes/page/#{pageId + 1}",
      "disabled" => pageId == pageCount
    })
    # @pages
    @keyword = ''
    @paginated = true
    render 'index'
  end

  def favorite
    @user = valid_user
    @favorited = true
    if @user
      id = params['id'].to_i
      positive = params['positive']
      if positive == "true"
        begin
          savedRecipe = SavedRecipe.new(:user_id => @user.id, :recipe_id => id)
          savedRecipe.save
        rescue
        end
      elsif positive == "false"
        begin
          SavedRecipe.where(user_id: @user.id, recipe_id: id).destroy_all
        rescue
        end
      end
    end
    redirect_to session.delete(:return_to)
  end

  def favorited

    @user = valid_user
    @favorited = true
    if !@user
      render 'have_to_login'
    else
      @summary = "Favorited recipes for #{@user.username}"
      session[:return_to] = request.original_url
      favorited = SavedRecipe.where(user_id: @user.id)
      @hide_search = true
      @recipes = favorited.map do |relation|
        recipe = Recipe.where(id: relation.recipe_id)[0]
        recipe.favorited = true
        recipe
      end
      render 'index'
    end
  end

  def search
    session[:return_to] = request.original_url
    @query = params['q']

    @user = valid_user
    @keywords = @query
                  .split(' ')
                  .reject { |c| c.empty? }
    @summary = "Search results for \"#{@query}\""
    @all = Recipe.includes(:ingredients).all
    @selected = @all.select do |recipe|
      @keywords.all? do |kw|
        recipe.ingredients.any? do |ingredient|
          ingredient.name.include?(kw)
        end
      end
    end
    puts("selected")
    @recipes = @selected.map { |comp| {
      "id" => comp.id,
      "image_url" => comp.image_url,
      "name" => comp.name,
      "calories" => comp.calories,
      "favorited" => @user ? SavedRecipe.where(user_id: @user.id, recipe_id: comp.id).count > 0 : nil,
      "ingredients" => comp.ingredients.map do |ingredient|
        result = ""
        @keywords.each do |kw|
          if ingredient.name.include?(kw)
            puts(ingredient.name, kw)
            result = " #{ingredient.name} ".split(kw).join("<span style=\"color:red\">#{kw}</span>").strip
            # if result.empty?
            #   result = "<span style=\"color:red\">#{kw}</span>"
            # end
            break
          end
        end
        result
      end
    } }
    @recipes = @recipes.sort { |a, b| a['calories'] <=> b['calories'] }
    puts(@recipes.inspect)
    @keyword = @query
    puts('321,', @keyword)
    render 'index'
  end

  def search_index
    puts(params)
    @query = params['keywords']
    if @query.nil? or @query.empty?
      redirect_to action: 'index'
    else
      redirect_to "/recipes/search/#{URI.encode(@query.strip)}"
    end
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build 
  end

  def create
    @user = valid_user
    puts params
    @maximum_length = Recipe.validators_on(:steps).first.options[:maximum]
    @recipe = Recipe.new
    if params[:recipe] && @user
      names = params[:recipe][:name]
      steps = params[:recipe][:steps]
      ings = params[:name]
      amounts = params[:amount]
      metric_units = params[:metric_unit]
      flash[:alert] = Array.new

      if names.strip.empty? 
        puts "Empty Recipe Name"  
        flash[:alert] << "Recipe has no name. "
      end
      if steps.strip.empty?
        puts "Empty Recipe Steps"  
        flash[:alert] << "Recipe has no steps. "
      end
      if ings.nil?
        flash[:alert] << "Recipe has no Ingredient. "
      else
        ings.each_with_index do |ing, index|
          if ing.strip == "" || amounts[index].strip == "" || amounts[index].strip.to_f == 0
            flash[:alert] << "Ingredient name or amount is empty. "
            break
          end
        end
      end
      

      if not flash[:alert].empty?
        redirect_to "/recipes/create"
      else
        original_id = -1
        loop do 
          original_id = 10_000 + Random.rand(100_000 - 10_000)
          break if Recipe.where(origin_id: original_id).first.nil?
        end 
        puts original_id

        recipe_calories = 0
        rec_ing_ids = Array.new
        ings.each_with_index do |ing, index|
          calorie = 0
          ing_id = -1
          ing_fin = ing.strip.downcase
          ing_db = Ingredient.find_by(name: ing_fin)
          if ing_db.nil?
            calorie = getCal(ing)
            new_ing_rec = Ingredient.create(:name => ing_fin, :calorie_per_serving => calorie)
            ing_id = new_ing_rec.id
          else
            calorie = ing_db.calorie_per_serving
            ing_id = ing_db.id
          end
          amount = amounts[index].strip.to_f
          recipe_calories += calorie*(amount)
          
          rec_ing = RecipeIngredient.create(:metric_unit => metric_units[index], :amount => amount, :ingredient_id => ing_id)
          rec_ing_ids << rec_ing.id
        end

        new_recipe_rec = Recipe.create(:name => names.strip, :steps => steps.strip, :origin_id => original_id, :calories => recipe_calories, :image_url => $customImg)
        rec_ing_ids.each do |rec_ing_id|
          rec_ing = RecipeIngredient.find_by(id: rec_ing_id)
          rec_ing.update(recipe_id: new_recipe_rec.id)
        end

        ownRecipe = OwnRecipe.new(:user_id => @user.id, :recipe_id => new_recipe_rec.id)
        ownRecipe.save

        flash[:notice] = "Yay! Your recipe has been created successfully!"
        redirect_to "/recipes/page/1"
      end
    end
    
  end

  def created
    @user = valid_user
    @favorited = false
    if !@user
      render 'have_to_login'
    else
      @summary = "Recipes created by #{@user.username}"
      session[:return_to] = request.original_url
      created = OwnRecipe.where(user_id: @user.id)
      @hide_search = true
      @recipes = created.map do |relation|
        recipe = Recipe.where(id: relation.recipe_id)[0]
        recipe
      end
      render 'index'
    end
  end

end
