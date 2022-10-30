require 'uri'

class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
    @keyword = ''
  end

  def search
    @query = params['q']
    puts('1312')
    puts(params['q'])
    @recipes = Recipe.all
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
      redirect_to "/recipes/search/#{URI.encode(@query)}"
    end
  end

  def new
    # default: render 'new' template
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
