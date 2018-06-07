class PostsController < ApplicationController

  def index
    @posts = Post.order(:updated_at).reverse
  end

  def search
    query = params[:search_posts].presence && params[:search_posts][:query]

    if query
      @posts = Post.search_published(query)
    end
  end

  private
  def post_params
    params.require(:post).permit(:id)
  end

end
