class CommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:id])
    @comment = @recipe.comments.create(comment_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
