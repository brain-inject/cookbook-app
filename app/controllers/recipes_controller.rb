class RecipesController < ApplicationController
  def home
    @recipes = Recipe.all
  end

  def single
    @recipe = Recipe.first
  end
end
