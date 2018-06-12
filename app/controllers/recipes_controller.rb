class RecipesController < ApplicationController

  def index
    @recipes = Recipe.order(:updated_at).reverse
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.instructions.build
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.author.blank? then @recipe.author = current_user.id end
    @recipe.save!
    if @recipe.save
      redirect_to @recipe, notice: "Recipe saved!"
    else
      render "new"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe, notice: "Your recipe has been updated!"
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
    params.require(:recipe).permit(:id, :title, :description, :author, :all_tags, ingredients_attributes: [:id, :quantity, :measurement, :name, :description, :_destroy], instructions_attributes: [:id, :description, :_destroy])
  end 
end
