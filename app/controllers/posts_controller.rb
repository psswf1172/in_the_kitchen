class PostsController < ApplicationController

  def index
    @posts = Post.all #try order_by to sort by most recent
  end

  private
  def post_params
    params.require(:post).permit(:id)
  end

end
