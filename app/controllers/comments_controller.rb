class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipe_path(@recipe), :notice => "oops! "
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :recipe_id)
  end

end
