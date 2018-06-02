class PostsController < ApplicationController

  def index
    @posts = Post.all #try order_by to sort by most recent
  end

end
