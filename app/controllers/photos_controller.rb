class PhotosController < ApplicationController

  def index
    @photos = Photo.with_attached_images.order(:updated_at).reverse
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save!
    if @photo.save
      Post.reindex
      redirect_to @photo, notice: "Photo saved!"
    else
      render "new"
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @recipe.update_attributes(photo_params)
      redirect_to @photo, notice: "Photo updated!"
    else
      render "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id]).destroy
    redirect_to photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:id, :title, :author, :description, :all_tags, :_destroy, images: [])
  end

end