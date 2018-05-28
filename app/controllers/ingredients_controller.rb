class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.create(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to root_url, :notice => "That ingredient was no good!"
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:quantity, :measurement, :name, :description)
  end

end
