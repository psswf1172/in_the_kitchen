class InstructionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.create(instruction_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instructions.find(params[:id])
    @instruction.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def instruction_params
    params.require(:instruction).permit(:step, :description)
  end  
end
