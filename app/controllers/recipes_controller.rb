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
    recipe = Recipe.create(
      title: params[:title],
      chef: params[:chef],
      instructions: params[:instructions],
      ingredients: params[:ingredients],
      image: params[:image]
      )

    flash[:success] = "Recipe Created"
    redirect_to "/recipes/#{recipe.id}"
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    recipe = Recipe.find_by(id: params[:id])
    
    recipe.update(
      title: params[:title],
      chef: params[:chef],
      instructions: params[:instructions],
      ingredients: params[:ingredients],
      image: params[:image]
      ) 

    flash[:success] = "Recipe Updated"
    redirect_to "/recipes/#{recipe.id}"
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy

    flash[:warning] = "Recipe Went Kablooey!!!"
    redirect_to "/"    
  end
end
