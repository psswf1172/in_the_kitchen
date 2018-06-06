class CommentsController < ApplicationController
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_to @commentable
    else
      redirect_to post_path(@commentable), :notice => "oops! "
    end
  end

  def destroy
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@commentable)
  end

  private
  def find_commentable
    params.each do | name, value |
      if name =~/(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def comment_params
    params.require(:comment).permit(:id, :body)
  end

end
