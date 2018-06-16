class UploadController < ActionController::Base

  IMAGE_EXT = [".gif", ".jpeg", ".jpg", ".png", ".svg"]

  def index
    # Configuration object.
    options = {
      # The name of your bucket.
      bucket: ENV['S3_BUCKET'],
 
      # S3 region. If you are using the default us-east-1, it this can be ignored.
      region: 's3-us-east-1',
 
      # The folder where to upload the images.
      keyStart: 'uploads/',
 
      # File access.
      acl: 'public-read',
 
      # AWS keys.
      accessKey: ENV['AWS_ACCESS_KEY_ID'],
      secretKey: ENV['AWS_SECRET_ACCESS_KEY']
    }
 
    # Compute the signature.
    @aws_data = FroalaEditorSDK::S3.data_hash(options)
  end

  def upload_image
    # if params[:file]
    #   FileUtils::mkdir_p(Rails.root.join("public/uploads/files"))
 
    #   ext = File.extname(params[:file].original_filename)
    #   ext = image_validation(ext)
    #   file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
    #   path = Rails.root.join("public/uploads/files/", file_name)
 
    #   File.open(path, "wb") {|f| f.write(params[:file].read)}
    #   view_file = Rails.root.join("/download_file/", file_name).to_s
    #   render :json => {:link => view_file}.to_json
 
    # else
    #   render :text => {:link => nil}.to_json
    # end

    render :json => FroalaEditorSDK::Image.upload(params, "public/uploads/images/")
  end

  def image_validation(ext)
    raise "Not allowed" unless IMAGE_EXT.include?(ext)
  end

  def access_file
    if File.exists?(Rails.root.join("public", "uploads", "files", params[:name]))
      send_data File.read(Rails.root.join("public", "uploads", "files", params[:name])), :disposition => "attachment"
    else
      render :nothing => true
    end
  end
 
end