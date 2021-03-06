# encoding: utf-8

class ImagesUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes

  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "respaldos/helpdesk/imagenes/#{model.created_at.year}/#{model.created_at.month}/#{model.helpdesk_id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  
  
  process :set_content_type
  process :save_content_type_and_size_in_model

  def save_content_type_and_size_in_model
    model.screenshot_content_type = file.content_type if file.content_type
    model.screenshot_file_size = file.size
  end
  
#  def save_content_type_and_size_in_model
#    model.content_type = file.content_type if file.content_type
#    model.size = file.size
#  end

  # Process files as they are uploaded:
  #  process :resize_to_limit => [400, 600], if file.content_type != 'zip'
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
     process :resize_to_limit => [300, 300]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png pdf iso zip)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end