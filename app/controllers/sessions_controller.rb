class SessionsController < ApplicationController

  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      redirect_to root_url, :notice => "oops! Something didn't match our records. Try again!", status: :unprocessable_entity
    end
  end
 
  def destroy
    sign_out
    redirect_to root_url, :notice => "Signed out!"
  end

end