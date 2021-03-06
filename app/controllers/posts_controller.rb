class PostsController < ApplicationController

  def index
      @posts = Post.order(:updated_at).reverse
  end

  def search
    query = params[:search_posts].presence && params[:search_posts][:query]

    if query
      @posts = Searchkick.search(query, emoji: true)
    end
  end

  private
  def post_params
    params.require(:post).permit(:id, :_destroy)
  end

end
