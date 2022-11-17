require 'uri'

def trim(num)
  i, f = num.to_i, num.to_f
  i == f ? i : f
end

$pageSize = 12

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

end
