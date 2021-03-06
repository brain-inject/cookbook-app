class RecipesController < ApplicationController
  def index
    sort_attribute = params[:sort]
    search_term = params[:search_term]

    if sort_attribute
      @recipes = Recipe.order(sort_attribute)
    else
      @recipes = Recipe.all
    end

    if search_term
      @recipes = @recipes.where("chef LIKE ? OR title LIKE ? OR ingredients LIKE ? OR instructions LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredient_list
    @instructions = @recipe.instruction_list
  end

  def new
    
  end

  def create
    recipe = Recipe.create(
      title: params[:title],
      user_id: current_user.id,
      instructions: params[:instructions],
      ingredients: params[:ingredients],
      prep_time: params[:prep_time],
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
      instructions: params[:instructions],
      ingredients: params[:ingredients],
      prep_time: params[:prep_time],
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
