class UploadController < ActionController::Base

  def index
    # Configuration object.
    options = {
      # The name of your bucket.
      bucket: 'in-the-kitchen-with-the-monacos-images',
 
      # S3 region. If you are using the default us-east-1, it this can be ignored.
      region: 'us-east',
 
      # The folder where to upload the images.
      keyStart: 'uploads',
 
      # File access.
      acl: 'public-read',
 
      # AWS keys.
      accessKey: 'AWS_ACCESS_KEY',
      secretKey: 'AWS_SECRET_KEY'
    }
 
    # Compute the signature.
    @aws_data = FroalaEditorSDK::S3.data_hash(options)
  end

  def upload_image
    render :json => FroalaEditorSDK::Image.upload(params, "public/uploads/images/")
  end
 
end