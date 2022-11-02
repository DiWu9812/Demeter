require 'uri'

def trim(num)
  i, f = num.to_i, num.to_f
  i == f ? i : f
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
    @recipes = Recipe.all
    @keyword = ''
  end

  def search
    @query = params['q']

    @keywords = @query
                  .split(' ')
                  .reject { |c| c.empty? }
    puts(@keywords)
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

end
