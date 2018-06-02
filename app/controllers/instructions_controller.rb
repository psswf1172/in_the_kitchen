class InstructionsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instruction.create(instruction_params)
    if @instruction.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to root_url, :notice => "That instruction won't work!"
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @instruction = @recipe.instruction.find(params[:id])
    @instruction.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def instruction_params
    params.require(:instruction).permit(:step, :description)
  end  
end
