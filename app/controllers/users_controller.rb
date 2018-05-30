class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      redirect_to root_url, :notice => "oops! Something didn't match our records. Try again!", status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :image)
end