class StoriesController < ApplicationController

  def index
    @stories = Story.order(:updated_at).reverse
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    if @story.author.blank? then @story.author = current_user.id end
    @story.save!
    if @story.save
      Story.reindex
      redirect_to @story, notice: "You're in the books, story teller!"
    else
      render "new"
    end
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
      Story.reindex
      redirect_to @story
    else
      render "edit"
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  private
  def story_params
    params.require(:story).permit(:id, :title, :description, :author, :all_tags, :_destroy)
  end
end
