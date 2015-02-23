# encoding: utf-8

class OfficesAttachmentUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
#   include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes

  storage :file
  # storage :fog

  def store_dir
    "respaldos/oficios/#{model.created_at.year}/#{model.created_at.month}/#{model.office_id}"
  end

  process :set_content_type
  process :save_content_type_and_size_in_model
  
  def save_content_type_and_size_in_model
    model.attachment_content_type = file.content_type if file.content_type
    model.attachment_file_size = file.size
  end
  
  def extension_white_list
    %w(pdf)
  end

end