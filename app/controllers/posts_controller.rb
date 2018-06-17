class PostsController < ApplicationController

  def index
    if params[:search_posts]
      @posts = Post.where('post LIKE ?', "%{params[:search_params][:query]}%")
    else
      @posts = Post.order(:updated_at).reverse
    end
  end

  # def search
  #   query = params[:search_posts].presence && params[:search_posts][:query]

  #   if query
  #     @posts = Post.search(query)
  #   end
  # end

  private
  def post_params
    params.require(:post).permit(:id, :_destroy)
  end

end
