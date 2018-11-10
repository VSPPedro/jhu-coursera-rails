class RecipesController < ApplicationController
  def index
    params["search"] ||= "chocolate"
    puts params["search"]
  end
end
