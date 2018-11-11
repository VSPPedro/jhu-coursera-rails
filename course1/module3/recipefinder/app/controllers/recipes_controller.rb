class RecipesController < ApplicationController
  def index
    params["search"] ||= "chocolate"
    @recipes_found = Recipe.for(params["search"])
    puts @recipes_found
  end
end
