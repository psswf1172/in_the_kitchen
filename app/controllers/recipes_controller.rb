class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to @recipe, notice: "Recipe saved!"
    else
      render "new"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :course, ingredients_attributes: [:quantity, :measurement, :name, :description, :_destroy], instructions_attributes: [:description, :_destroy] )
  end 
end
