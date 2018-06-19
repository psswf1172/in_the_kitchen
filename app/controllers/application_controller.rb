class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def image_upload_hash
    @aws_data = { 
      bucket: ENV["S3_BUCKET"],
      region: "s3-us-east-1",
      keyStart: "uploads/",
      callback: function(url, key) {
        console.log(url);
        console.log(key);
      },
      acl: "public-read",
      accessKeyId: ENV["AWS_ACCESS_KEY_ID"],
      secretAccessKey: ENV["AWS_SECRET_ACCESS_KEY"]
    }
  end

  protected
  def after_sign_in_path_for(users)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
  end

  private
  def current_user
    @current_user ||= super 
  end

  def signed_in?
    @current_user_id.present?
  end
end
