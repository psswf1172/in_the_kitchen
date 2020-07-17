class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token
  
  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
    else
      session["devise.#{provider_name}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def facebook
    sign_in_with "Facebook"
  end

  def linkedin
    sign_in_with "LinkedIn"
  end

  def twitter
    sign_in_with "Twitter"
  end

  def google_oauth2
    sign_in_with "Google"
  end


  # def facebook
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   if @user.persisted?
  #     sign_in_and_redirect @user
  #     set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  # def google
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
  #     redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #   end
  # end

  # def failure
  #   redirect_to root_path
  # end

  # private
  # def omniauth_params
  #   request.env["omniauth.auth"]
  # end
end