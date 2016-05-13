class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    
  end

  def create
    @recipe = Recipe.create(
      title: params[:title],
      chef: params[:chef],
      instructions: params[:instructions],
      ingredients: params[:ingredients]
      )

    render 'show.html.erb'
  end
end
