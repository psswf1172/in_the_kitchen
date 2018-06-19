class UploadController < ActionController::Base
 
  def index
    options = {
      bucket: ENV["S3_BUCKET"],
      region: "us-east-1",
      
      key_start: "uploads/",
 
      # File access.
      acl: "public-read",
 
      # AWS keys.
      accessKey: ENV["AWS_ACCESS_KEY_ID"],
      secretKey: ENV["AWS_SECRET_ACCESS_KEY"]
    }
 
    # Compute the signature.
    @aws_data = FroalaEditorSDK::S3.data_hash(options)
  end
 
end